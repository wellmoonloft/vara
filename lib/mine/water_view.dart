import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/mine/wave_view.dart';

class WaterView extends StatefulWidget {
  const WaterView(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;

  @override
  _WaterViewState createState() => _WaterViewState();
}

class _WaterViewState extends State<WaterView> with TickerProviderStateMixin {
  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
              child: Consumer<ProviderData>(
                  builder: (context, providerdata, child) {
                double investIncome = 0.0;
                double investIncomeChange = 0.0;
                double expenses = 0.0;
                double expensesChange = 0.0;
                double freedomService = 0.0;
                num rate = 1;

                providerdata.investList.forEach((element) {
                  providerdata.currencyData.forEach((element1) {
                    if (element.currency == element1.short) {
                      rate = providerdata.currency.rate / element1.rate;
                      if (element.status == 'FINISHED') {
                        investIncome = investIncome +
                            (element.interest != null
                                ? element.interest * rate
                                : 0);
                      }
                    }
                  });
                });

                providerdata.billList.forEach((element) {
                  providerdata.currencyData.forEach((element1) {
                    if (element.currency == element1.short) {
                      rate = providerdata.currency.rate / element1.rate;
                      if (element.mark == 0) {
                        expenses = expenses + element.amount * rate;
                      }
                    }
                  });
                });

                if (expenses == 0) {
                  if (investIncome == 0) {
                    freedomService = 0;
                    investIncomeChange = 1;
                    expensesChange = 0;
                  } else {
                    freedomService = 100;
                    investIncomeChange = 0;
                    expensesChange = 0;
                  }
                } else {
                  if (investIncome == 0) {
                    freedomService = 0;
                    investIncomeChange = expenses;
                    expensesChange = expenses;
                  } else {
                    freedomService = investIncome / expenses * 100;
                    if (investIncome >= expenses) {
                      investIncomeChange = 0;
                      expensesChange = 0;
                    } else {
                      investIncomeChange = expenses - investIncome;
                      expensesChange = expenses - investIncome;
                    }
                  }
                }

                return Container(
                  padding: AppTheme.inboxpadding,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, bottom: 3),
                                  child: Text(
                                    investIncomeChange > 100000.00
                                        ? '+' +
                                            providerdata.currency.iconName +
                                            NumberFormat.compact(
                                                    locale:
                                                        Intl.getCurrentLocale())
                                                .format(
                                                    investIncomeChange *
                                                        widget
                                                            .mainScreenAnimation
                                                            .value)
                                        : '+' +
                                            NumberFormat(
                                                    providerdata
                                                            .currency.iconName +
                                                        " ###,###.0#",
                                                    Intl.getCurrentLocale())
                                                .format(investIncomeChange *
                                                    widget.mainScreenAnimation
                                                        .value),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32,
                                      color: ColorTheme.puristbluedarker,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, bottom: 8),
                                  child: Text(
                                    S.current.InvestedProfit,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      //fontFamily: FintnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: -0.2,
                                      color: ColorTheme.puristbluedarker
                                          .withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 4, top: 18, bottom: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.award,
                                    size: 14,
                                    color: ColorTheme.cantaloupedarker,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      S.current.Keepfinancialfreedom,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        //fontFamily: ColorTheme.fontName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        letterSpacing: 0.0,
                                        color: ColorTheme.cantaloupedarker,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, bottom: 3),
                                  child: Text(
                                    expensesChange > 100000.00
                                        ? '-' +
                                            providerdata.currency.iconName +
                                            ' ' +
                                            NumberFormat.compact(
                                                    locale:
                                                        Intl.getCurrentLocale())
                                                .format(
                                                    expensesChange *
                                                        widget
                                                            .mainScreenAnimation
                                                            .value)
                                        : '-' +
                                            NumberFormat(
                                                    providerdata
                                                            .currency.iconName +
                                                        " ###,###.0#",
                                                    Intl.getCurrentLocale())
                                                .format(expensesChange *
                                                    widget.mainScreenAnimation
                                                        .value),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32,
                                      color: ColorTheme.cantaloupe,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, bottom: 8),
                                  child: Text(
                                    S.current.Expenses,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      //fontFamily: FintnessAppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: -0.2,
                                      color: ColorTheme.cantaloupe
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 8,
                        ),
                        child: Container(
                          width: 60,
                          height: 160,
                          decoration: BoxDecoration(
                            color: ColorTheme.forWater,
                            borderRadius: AppTheme.normalBorderRadius,
                          ),
                          child: WaveView(
                            percentageValue: freedomService,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              })),
        );
      },
    );
  }
}
