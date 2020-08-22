import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/default_data.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/utils/db_helper.dart';

class CurrencyView extends StatefulWidget {
  const CurrencyView({Key key}) : super(key: key);

  @override
  _CurrencyViewState createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> {
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
            title: Text('Profile Settings', style: AppTheme.titleText),
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
                      'Account information',
                      textAlign: TextAlign.start,
                      style: AppTheme.titleTextSmallLighter,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    color: ColorTheme.pantone,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              Padding(
                  padding: AppTheme.outboxpadding,
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.userAlt,
                                color: ColorTheme.cassis,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Name',
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
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 5),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    color: ColorTheme.pantone,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
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
                                    color: ColorTheme.cassis,
                                  );
                                }),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  'Currency',
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
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 5),
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    color: ColorTheme.pantone,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
