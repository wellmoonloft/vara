import 'package:flutter/material.dart';
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
                  } else {
                    freedomService = 100;
                    investIncomeChange = 0;
                  }
                } else {
                  if (investIncome == 0) {
                    freedomService = 0;
                    investIncomeChange = expenses;
                  } else {
                    if (investIncome >= expenses) {
                      freedomService = 100;
                      investIncomeChange = 0;
                    } else {
                      freedomService = investIncome / expenses * 100;
                      investIncomeChange = expenses - investIncome;
                    }
                  }
                }

                return Container(
                  padding: AppTheme.inboxpadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width - 58 - 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 0, bottom: 15),
                              child: Text(
                                providerdata.currency.iconName +
                                    ' ' +
                                    NumberFormat.compact(
                                            locale: Intl.getCurrentLocale())
                                        .format(investIncomeChange *
                                            widget.mainScreenAnimation.value),
                                textAlign: TextAlign.start,
                                style: setHomeNumnberText(
                                    ColorTheme.puristbluedarker),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 0, bottom: 3),
                              child: Text(
                                S.current.ReduceExpenses,
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    setNoteTitle(ColorTheme.cantaloupedarker),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 160,
                        decoration: BoxDecoration(
                          color: ColorTheme.forWater,
                          borderRadius: AppTheme.normalBorderRadius,
                        ),
                        child: WaveView(
                          percentageValue: freedomService,
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
