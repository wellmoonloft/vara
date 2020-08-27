import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import 'package:vara/utils/db_helper.dart';
import 'currency_view.dart';
import 'language_view.dart';
import 'mine_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _value = true;
  String _path = 'ss';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: ColorTheme.white,
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: ColorTheme.white,
            elevation: 0,
            title: Text(S.current.Settings, style: AppTheme.titleText),
            leading: IconButton(
                icon: FaIcon(FontAwesomeIcons.times),
                color: ColorTheme.greyquadradarker,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: ListView(
            children: [
              // Padding(
              //     padding: AppTheme.outboxpadding,
              //     child: Container(
              //       child: Text(
              //         S.current.AccountInformation,
              //         textAlign: TextAlign.start,
              //         style: AppTheme.titleTextSmallLighter,
              //       ),
              //     )),
              //OneHeightBorder(top: 0, left: 16, right: 16, bottom: 10),
              Padding(
                  padding: AppTheme.inboxpadding,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MineView()));
                      },
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.userAlt,
                                    color: ColorTheme.greydarker,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    S.current.AccountInformation,
                                    style: AppTheme.titleTextSmallLighter,
                                  ),
                                ],
                              ),
                              Consumer<ProviderData>(
                                  builder: (context, providerdata, child) {
                                return Text(
                                  providerdata.person.firstname,
                                );
                              }),
                            ]),
                      ))),
              OneHeightBorder(top: 10, left: 16, right: 16, bottom: 10),
              Padding(
                  padding: AppTheme.inboxpadding,
                  child: Container(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return CurrencyView();
                          })).then((data) async {
                            if (data != null) {
                              var providerData = Provider.of<ProviderData>(
                                  context,
                                  listen: false);
                              await providerData.setCurrency(data);
                              Settings settings = Settings();
                              settings.currency = data;
                              await DBHelper().updateSettings(settings);
                            }
                          });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Consumer<ProviderData>(
                                      builder: (context, providerdata, child) {
                                    return FaIcon(
                                      providerdata.currency.icon,
                                      color: ColorTheme.greydarker,
                                    );
                                  }),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    S.current.Currency,
                                    style: AppTheme.titleTextSmallLighter,
                                  ),
                                ],
                              ),
                              FaIcon(
                                FontAwesomeIcons.chevronRight,
                                size: 18,
                                color: ColorTheme.greydarker,
                              )
                            ])),
                  )),
              OneHeightBorder(top: 10, left: 16, right: 16, bottom: 10),
              Padding(
                  padding: AppTheme.inboxpadding,
                  child: Container(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return LanguageView();
                          })).then((data) async {
                            if (data != null) {
                              Settings settings = Settings();
                              switch (data.toString()) {
                                case '0':
                                  {
                                    settings.language = 'HK';
                                  }
                                  break;

                                case '1':
                                  {
                                    settings.language = 'CN';
                                  }
                                  break;
                                case '2':
                                  {
                                    settings.language = 'EN';
                                  }
                                  break;
                                case '3':
                                  {
                                    settings.language = 'JP';
                                  }
                                  break;
                                default:
                                  {
                                    settings.language = 'EE';
                                  }
                                  break;
                              }

                              await DBHelper().updateSettings(settings);
                              setState(() {
                                //print(Intl.getCurrentLocale());
                                // update language data;
                              });
                            }
                          });
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.globeAsia,
                                    color: ColorTheme.greydarker,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    S.current.Language,
                                    style: AppTheme.titleTextSmallLighter,
                                  ),
                                ],
                              ),
                              FaIcon(
                                FontAwesomeIcons.chevronRight,
                                size: 18,
                                color: ColorTheme.greydarker,
                              )
                            ])),
                  )),
              OneHeightBorder(top: 10, left: 16, right: 16, bottom: 0),
              Padding(
                  padding: AppTheme.inboxpadding,
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.database,
                                color: ColorTheme.greydarker,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.current.SaveOnCloud,
                                style: AppTheme.titleTextSmallLighter,
                              ),
                            ],
                          ),
                          Switch(
                            value: _value,
                            onChanged: (newValue) {
                              setState(() {
                                _value = newValue;
                              });
                            },
                            activeColor: Colors.red,
                            activeTrackColor: Colors.red,
                            inactiveThumbColor: Colors.green,
                            inactiveTrackColor: Colors.green,
                          ),
                        ]),
                  )),
              OneHeightBorder(top: 0, left: 16, right: 16, bottom: 10),
              _value
                  ? Container()
                  : Padding(
                      padding: AppTheme.inboxpadding,
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.locationArrow,
                                    size: 18,
                                    color: ColorTheme.greydarker,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    S.current.Path,
                                    style: AppTheme.titleTextSmallLighter,
                                  ),
                                ],
                              ),
                              Text(_path)
                            ]),
                      )),
              _value
                  ? Container()
                  : OneHeightBorder(top: 15, left: 16, right: 16, bottom: 0),
            ],
          )),
    );
  }
}
