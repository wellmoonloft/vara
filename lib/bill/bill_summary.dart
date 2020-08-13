import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/utils/app_theme.dart';
import 'package:vara/utils/app_ui.dart';
import 'package:vara/utils/toolkit.dart';
import '../utils/color_theme.dart';

class BillSummaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double netIncome = 0.0;
    double income = 0.0;
    double expenses = 0.0;
    double freedomService = 0.0;
    if (Provider.of<InvestData>(context).billList != null) {
      Provider.of<InvestData>(context).billList.forEach((element) {
        if (element['mark']) {
          income = income + element['amount'];
        } else {
          expenses = expenses + element['amount'];
        }
      });
      netIncome = income - expenses;
      freedomService = expenses / income;
    }
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: AppTheme.outboxpadding,
            child: Container(
              decoration: AppTheme.boxDecoration,
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
                                        color: ColorTheme.cantaloupe,
                                        width: 3,
                                        height: 50),
                                    SummaryTopTitile(
                                      title: 'Net Income',
                                      value: '€ ' +
                                          formatNum(netIncome, 2).toString(),
                                      color: ColorTheme.cantaloupe,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: AppTheme.leftRightPadding),
                          child: Center(
                            child: SummaryTopGraph(
                              title: 'Financial Freedom',
                              value: freedomService,
                              color: ColorTheme.cantaloupe,
                              subcolor: ColorTheme.cantaloupelighter,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppTheme.inboxpadding,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: ColorTheme.background,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppTheme.inboxpadding,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SummaryBottom(
                            title: 'Income',
                            subtitle: '',
                            value: '€ ' + formatNum(income, 2).toString(),
                            color: ColorTheme.puristbluedarker,
                            subcolor: '#87A0E5',
                          ),
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SummaryBottom(
                              title: 'Expenses',
                              subtitle: '',
                              value: '€ ' + formatNum(expenses, 2).toString(),
                              color: ColorTheme.cantaloupe,
                              subcolor: '#F1B440',
                            )
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
