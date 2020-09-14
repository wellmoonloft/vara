import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/home/home_page.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/default_data.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import 'package:vara/utils/db_helper.dart';
import 'currency_view.dart';
import 'language_view.dart';
import 'mine_view.dart';
import 'package:vara/utils/global.dart' as Globals;

class SettingsView extends StatefulWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _value = Globals.Global.myStoreage.isCloud;
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
            title: Text(S.current.Settings, style: AppTheme.subPageTitle),
            leading: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.times,
                  size: 20,
                  color: ColorTheme.mainBlack,
                ),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            tabBodyView: 'MineHome',
                          )));
                }),
          ),
          body: ListView(
            children: [
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
                                    color: ColorTheme.mainBlack,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    S.current.AccountInformation,
                                    style: AppTheme.listTitle,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Consumer<ProviderData>(
                                      builder: (context, providerdata, child) {
                                    return Text(
                                      providerdata.person.firstname,
                                      style: AppTheme.listTitle,
                                    );
                                  }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    size: 16,
                                    color: ColorTheme.mainBlack,
                                  ),
                                ],
                              ),
                            ]),
                      ))),
              OneHeightBorder(top: 10, left: 16, right: 16, bottom: 10),
              Padding(
                  padding: AppTheme.inboxpadding,
                  child: Container(
                    child: InkWell(onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return CurrencyView();
                      })).then((data) async {
                        if (data != null) {
                          var providerData =
                              Provider.of<ProviderData>(context, listen: false);
                          await providerData.setCurrency(data);
                          Settings settings = Settings();
                          settings.currency = data;
                          await DBHelper().updateSettings(settings);
                        }
                      });
                    }, child: Consumer<ProviderData>(
                        builder: (context, providerdata, child) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 2,
                                ),
                                FaIcon(
                                  providerdata.currency.icon,
                                  color: ColorTheme.mainBlack,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  S.current.Currency,
                                  style: AppTheme.listTitle,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  providerdata.currency.short,
                                  style: AppTheme.listTitle,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.chevronRight,
                                  size: 16,
                                  color: ColorTheme.mainBlack,
                                ),
                              ],
                            )
                          ]);
                    })),
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
                                    color: ColorTheme.mainBlack,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    S.current.Language,
                                    style: AppTheme.listTitle,
                                  ),
                                ],
                              ),
                              FaIcon(
                                FontAwesomeIcons.chevronRight,
                                size: 16,
                                color: ColorTheme.mainBlack,
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
                            return CurrencyView();
                          })).then((data) async {});
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.solidQuestionCircle,
                                    color: ColorTheme.mainBlack,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    S.current.Help,
                                    style: AppTheme.listTitle,
                                  ),
                                ],
                              ),
                              FaIcon(
                                FontAwesomeIcons.chevronRight,
                                size: 16,
                                color: ColorTheme.mainBlack,
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
                                color: ColorTheme.mainBlack,
                                size: 20,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                S.current.SaveOnCloud,
                                style: AppTheme.listTitle,
                              ),
                            ],
                          ),
                          Switch(
                            value: _value,
                            onChanged: (newValue) async {
                              print(newValue);
                              MyStoreage _storeage = MyStoreage();
                              if (newValue) {
                                _storeage.isCloud = false;
                                _value = true;
                                _storeage.path =
                                    (await getApplicationDocumentsDirectory())
                                        .path;
                              } else {
                                try {
                                  var _path =
                                      await FilePicker.getDirectoryPath();
                                  if (_path != null) {
                                    print(_path);
                                    _storeage.isCloud = true;
                                    _value = false;
                                    _storeage.path =
                                        (await getApplicationDocumentsDirectory())
                                            .path;
                                  }
                                } on PlatformException catch (e) {
                                  print("Unsupported operation" + e.toString());
                                }
                              }
                              if (_storeage.isCloud == null ||
                                  _storeage.path == null) {
                              } else {
                                //providerdata.setMayStoreage(_storeage);
                              }
                            },
                            activeColor: Colors.red,
                            activeTrackColor: Colors.red,
                            inactiveThumbColor: Colors.green,
                            inactiveTrackColor: Colors.green,
                          )
                        ]),
                  )),
              OneHeightBorder(top: 0, left: 16, right: 16, bottom: 10),
            ],
          )),
    );
  }
}
