import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/default_data.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class CurrencyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> currencyList = [];
    // String currencyValue;
    List<CurrencyData> currencyData =
        Provider.of<ProviderData>(context).currencyData;
    // CurrencyData currency = Provider.of<ProviderData>(context).currency;
    //currencyValue = currency.short;
    if (currencyData != null) {
      currencyData.forEach((element) {
        currencyList.add(element.short);
      });
    }

    return Container(
        child: Scaffold(
            backgroundColor: ColorTheme.white,
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: ColorTheme.white,
              elevation: 0,
              title: Text(S.current.Currency, style: AppTheme.titleText),
              leading: IconButton(
                  icon: FaIcon(FontAwesomeIcons.times),
                  color: ColorTheme.greyquadradarker,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: ListView.separated(
              itemCount: currencyList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: AppTheme.outboxpadding,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop(currencyList[index]);
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currencyList[index],
                                textAlign: TextAlign.start,
                                style: AppTheme.titleTextSmallLighter,
                              ),
                              // FaIcon(
                              //   FontAwesomeIcons.check,
                              //   color: ColorTheme.grey,
                              //   size: 18,
                              // )
                            ])));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: ColorTheme.pantone,
                  height: 2,
                );
              },
            )));
  }
}
