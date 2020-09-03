import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
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
                    num rate = 1;
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
                    netIncome = income - expenses;
                    if (expenses == 0 || income == 0) {
                      freedomService = 0;
                    } else {
                      freedomService = income / expenses * 100;
                    }

                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
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
                                                  title: S.current.NetIncome,
                                                  value: providerdata
                                                          .currency.iconName +
                                                      ' ' +
                                                      NumberFormat.compact(
                                                              locale: Intl
                                                                  .getCurrentLocale())
                                                          .format(netIncome *
                                                              animation.value),
                                                  color: ColorTheme
                                                      .cantaloupedarker,
                                                ),
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
                                          title: S.current.FinancialFreedom,
                                          value:
                                              freedomService * animation.value,
                                          color: ColorTheme.cantaloupe,
                                          subcolor:
                                              ColorTheme.cantaloupelighter,
                                          mark: false,
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
