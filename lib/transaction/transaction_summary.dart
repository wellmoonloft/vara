import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import 'package:intl/intl.dart';
import '../theme_ui/color_theme.dart';

class BillSummaryView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const BillSummaryView({Key key, this.animationController, this.animation})
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
                    double netIncome = 0.0;
                    double income = 0.0;
                    double expenses = 0.0;
                    double freedomService = 0.0;
                    bool mark = true;

                    providerdata.billList.forEach((element) {
                      if (element.mark == 0) {
                        expenses = expenses + element.amount;
                      } else {
                        income = income + element.amount;
                      }
                    });
                    netIncome = income - expenses;
                    if (netIncome > 0) {
                      mark = true;
                    } else {
                      netIncome = netIncome.abs();
                      mark = false;
                    }
                    freedomService = income / expenses * 100;

                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          //decoration: AppTheme.boxDecoration,
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
                                                    color:
                                                        ColorTheme.cantaloupe,
                                                    width: 3,
                                                    height: 50),
                                                SummaryTopTitile(
                                                  title: 'Net Income',
                                                  value: NumberFormat(
                                                          "€ ###,###.0#",
                                                          "en_US")
                                                      .format(netIncome *
                                                          animation.value),
                                                  color: mark
                                                      ? ColorTheme
                                                          .neogreendarker
                                                      : ColorTheme.darkred,
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
                                          value:
                                              freedomService * animation.value,
                                          color: ColorTheme.cantaloupe,
                                          subcolor:
                                              ColorTheme.cantaloupelighter,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  })));
        });
  }
}
