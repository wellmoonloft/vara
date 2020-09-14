import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class CurrencyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            backgroundColor: ColorTheme.white,
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: ColorTheme.white,
              elevation: 0,
              title: Text(S.current.Currency, style: AppTheme.subPageTitle),
              leading: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.times,
                    size: 18,
                  ),
                  color: ColorTheme.greyquadradarker,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body:
                Consumer<ProviderData>(builder: (context, providerdata, child) {
              return ListView.separated(
                itemCount: providerdata.currencyData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: AppTheme.inboxpadding,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pop(providerdata.currencyData[index].short);
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      width: 40,
                                      height: 40,
                                      image: AssetImage(providerdata
                                          .currencyData[index].flags),
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      providerdata.currencyData[index].nation,
                                      textAlign: TextAlign.start,
                                      style: AppTheme.listTitle,
                                    ),
                                  ],
                                ),
                                Text(
                                  providerdata.currencyData[index].short,
                                  textAlign: TextAlign.start,
                                  style: AppTheme.listTitle,
                                ),
                              ])));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: ColorTheme.pantone,
                    height: 1,
                  );
                },
              );
            })));
  }
}
