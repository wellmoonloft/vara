import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/default_data.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import 'package:vara/utils/db_helper.dart';

import 'language_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  _CurrencyViewState createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<SettingsView> {
  String currencyValue;
  var items = List<DropdownMenuItem<String>>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CurrencyData> currencyData =
        Provider.of<ProviderData>(context).currencyData;
    CurrencyData currency = Provider.of<ProviderData>(context).currency;
    currencyValue = currency.short;
    if (currencyData != null && items.length == 0) {
      for (var i = 0; i < currencyData.length; i++) {
        items.add(DropdownMenuItem(
            child: Text(
              currencyData[i].iconName + ' ' + currencyData[i].short,
            ),
            value: currencyData[i].short));
      }
    }

    return Container(
      //color: ColorTheme.black.withOpacity(0.4),
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
              Padding(
                  padding: AppTheme.outboxpadding,
                  child: Container(
                    // alignment: Alignment.centerLeft,
                    child: Text(
                      S.current.AccountInformation,
                      textAlign: TextAlign.start,
                      style: AppTheme.titleTextSmallLighter,
                    ),
                  )),
              OneHeightBorder(top: 0, left: 16, right: 16, bottom: 10),
              Padding(
                  padding: AppTheme.inboxpadding,
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
                                S.current.UserName,
                                style: AppTheme.titleTextSmallLighter,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text('data'),
                          )
                        ]),
                  )),
              OneHeightBorder(top: 10, left: 16, right: 16, bottom: 0),
              Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 5),
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 4,
                                ),
                                Consumer<ProviderData>(
                                    builder: (context, providerdata, child) {
                                  return FaIcon(
                                    providerdata.currency.icon,
                                    color: ColorTheme.greydarker,
                                  );
                                }),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  S.current.Currency,
                                  style: AppTheme.titleTextSmallLighter,
                                ),
                              ],
                            ),
                            flex: 3,
                          ),
                          Expanded(
                            child: Container(
                                child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              iconSize: 16,
                              underline: Container(),
                              value: currencyValue,
                              onChanged: (String newValue) async {
                                setState(() {
                                  currencyValue = newValue;
                                });

                                var providerData = Provider.of<ProviderData>(
                                    context,
                                    listen: false);
                                await providerData.setCurrency(newValue);
                                Settings settings = Settings();
                                settings.currency = newValue;
                                await DBHelper().updateSettings(settings);
                              },
                              items: items,
                            )),
                            flex: 1,
                          )
                        ]),
                  )),
              OneHeightBorder(top: 5, left: 16, right: 16, bottom: 10),
              Padding(
                  padding: AppTheme.inboxpadding,
                  child: Container(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return LanguageView();
                          })).then((data) {
                            if (data != null) {
                              // setState(() {
                              //   categroyTitle = data['title'];
                              //   categroyTitleColor = data['color'];
                              //   categroyColor = data['color'];
                              //   categroyIcon = data['icon'];
                              //   categroy = data['categroy'];
                              //   mark = data['mark'];
                              // });
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
                                    'Language',
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
                  ))
            ],
          )),
    );
  }
}
