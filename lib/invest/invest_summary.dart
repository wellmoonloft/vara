import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';

import '../theme_ui/color_theme.dart';

class InvestSummaryView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const InvestSummaryView({Key key, this.animationController, this.animation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
              opacity: animation,
              child: Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation.value), 0.0),
                  child: Consumer<ProviderData>(
                      builder: (context, providerdata, child) {
                    double investIncome = 0.0;
                    double totalYield = 0.0;
                    double totalInvest = 0.0;
                    double short = 0.0;
                    double mid = 0.0;
                    double long = 0.0;
                    int mark = 0;
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
                            if (element.interest > 0) {
                              totalYield = totalYield + element.totalyield;
                              mark++;
                            }
                            // totalYield = investIncome *
                            //     (element.totalyield != null
                            //         ? element.totalyield
                            //         : 0) /
                            //     (element.interest != null ? element.interest : 0);
                          } else {
                            totalInvest = totalInvest + element.amount * rate;
                            if (element.type == 'SHORT') {
                              short = short + element.amount * rate;
                            }
                            if (element.type == 'MID') {
                              mid = mid + element.amount * rate;
                            }
                            if (element.type == 'LONG') {
                              long = long + element.amount * rate;
                            }
                          }
                        }
                      });
                    });
                    if (totalInvest == 0 || mark == 0) {
                      totalYield = 0.0;
                    } else {
                      totalYield = totalYield / mark * 100;
                    }

                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: AppTheme.outboxpadding,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 4),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              BeforeTitle(
                                                  color: ColorTheme.cassis,
                                                  width: 3,
                                                  height: 50),
                                              SummaryTopTitile(
                                                title: 'Invested Profit',
                                                value: NumberFormat(
                                                        providerdata.currency
                                                                .iconName +
                                                            " ###,###.0#",
                                                        "en_US")
                                                    .format(investIncome *
                                                        animation.value),
                                                color: ColorTheme.cassis,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              BeforeTitle(
                                                  color: ColorTheme.cassis,
                                                  width: 3,
                                                  height: 50),
                                              SummaryTopTitile(
                                                title: 'Invested Funds',
                                                value: NumberFormat(
                                                        providerdata.currency
                                                                .iconName +
                                                            " ###,###.0#",
                                                        "en_US")
                                                    .format(totalInvest *
                                                        animation.value),
                                                color: ColorTheme.cassis,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: AppTheme.leftRightPadding),
                                    child: Center(
                                      child: SummaryTopGraph(
                                        title: 'Total Yield year',
                                        value: totalYield * animation.value,
                                        color: ColorTheme.cassis,
                                        subcolor: ColorTheme.cassislighter,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: AppTheme.inboxpadding,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: SummaryBottom(
                                      title: 'Short',
                                      subtitle: 'less 90days',
                                      value: NumberFormat(
                                              providerdata.currency.iconName +
                                                  " ###,###.0#",
                                              "en_US")
                                          .format(short * animation.value),
                                      color: ColorTheme.puristbluedarker,
                                      subcolor: '#87A0E5',
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SummaryBottom(
                                          title: 'Mid',
                                          subtitle: 'less 365 days',
                                          value: NumberFormat(
                                                  providerdata
                                                          .currency.iconName +
                                                      " ###,###.0#",
                                                  "en_US")
                                              .format(mid * animation.value),
                                          color: ColorTheme.cassis,
                                          subcolor: '#F56E98',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SummaryBottom(
                                          title: 'Long',
                                          subtitle: 'over 365 days',
                                          value: NumberFormat(
                                                  providerdata
                                                          .currency.iconName +
                                                      " ###,###.0#",
                                                  "en_US")
                                              .format(long * animation.value),
                                          color: ColorTheme.cantaloupe,
                                          subcolor: '#F1B440',
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ));
                  })));
        });
  }
}
