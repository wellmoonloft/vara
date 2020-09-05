import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';

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
                      totalYield = totalYield / mark;
                    }
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        //padding: AppTheme.outboxpadding,
                        child: Container(
                            // decoration: AppTheme.boxDecoration,
                            child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 0, top: 16, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 2),
                                      child: Text(
                                        S.current.InvestedProfit,
                                        textAlign: TextAlign.center,
                                        style: AppTheme.noteTitle,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, top: 5),
                                            child: NumbersText(
                                                value: investIncome *
                                                    animation.value,
                                                style: AppTheme.mainNumbers,
                                                currency: providerdata
                                                    .currency.iconName)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 4, bottom: 2),
                                      child: Text(
                                        S.current.InvestedFunds,
                                        textAlign: TextAlign.center,
                                        style: AppTheme.noteTitle,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, top: 5),
                                            child: NumbersText(
                                                value: totalInvest *
                                                    animation.value,
                                                style: AppTheme.mainNumbers,
                                                currency: providerdata
                                                    .currency.iconName)),
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: AppTheme.leftRightPadding),
                                  child: Center(
                                    child: SummaryTopGraph(
                                      title: S.current.TotalYieldYear,
                                      value: totalYield * animation.value,
                                      mark: true,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              padding: AppTheme.inboxpadding,
                              child: Container(
                                  padding: AppTheme.inboxpadding,
                                  decoration: AppTheme.boxDecorationBlack,
                                  child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: SummaryBottom(
                                              title: S.current.Short,
                                              subtitle: S.current.ShortSub,
                                              currency: providerdata
                                                  .currency.iconName,
                                              value: short * animation.value),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SummaryBottom(
                                                  title: S.current.Mid,
                                                  subtitle: S.current.MidSub,
                                                  currency: providerdata
                                                      .currency.iconName,
                                                  value: mid * animation.value),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              SummaryBottom(
                                                  title: S.current.Long,
                                                  subtitle: S.current.LongSub,
                                                  currency: providerdata
                                                      .currency.iconName,
                                                  value:
                                                      long * animation.value),
                                            ],
                                          ),
                                        )
                                      ])))
                        ])));
                  })));
        });
  }
}
