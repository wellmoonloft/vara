import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class ChartTitle extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const ChartTitle({Key key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
              opacity: animation,
              child: new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation.value), 0.0),
                  child: Consumer<ProviderData>(
                      builder: (context, providerdata, child) {
                    double income = 0.0;
                    double expenses = 0.0;
                    num rate = 1;

                    if (providerdata.billList != null) {
                      providerdata.billList.forEach((element) {
                        providerdata.currencyData.forEach((element1) {
                          if (element.currency == element1.short) {
                            rate = providerdata.currency.rate / element1.rate;
                            if (element.mark == 0) {
                              expenses = expenses + element.amount * rate;
                            } else {
                              income = income + element.amount * rate;
                            }
                          }
                        });
                      });
                    }
                    return Row(children: <Widget>[
                      Padding(
                        padding: AppTheme.chartTitlepadding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              S.current.Income,
                              textAlign: TextAlign.start,
                              style: setNoteTitleLighter(ColorTheme.greydarker),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6, bottom: 6),
                              child: Text(
                                  providerdata.currency.iconName +
                                      ' ' +
                                      NumberFormat.compact(
                                              locale: Intl.getCurrentLocale())
                                          .format(income * animation.value),
                                  textAlign: TextAlign.start,
                                  style: setHomeNumnberText(
                                      ColorTheme.puristbluedarker)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: AppTheme.chartTitlepadding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              S.current.Expenses,
                              textAlign: TextAlign.end,
                              style: setNoteTitleLighter(ColorTheme.greydarker),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6, bottom: 6),
                              child: Text(
                                  providerdata.currency.iconName +
                                      ' ' +
                                      NumberFormat.compact(
                                              locale: Intl.getCurrentLocale())
                                          .format(expenses * animation.value),
                                  textAlign: TextAlign.end,
                                  style: setHomeNumnberText(ColorTheme.cassis)),
                            ),
                          ],
                        ),
                      )
                    ]);
                  })));
        });
  }
}
