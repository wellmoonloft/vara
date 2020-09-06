import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';

class AccountView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const AccountView({Key key, this.animationController, this.animation})
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
                    double totalInvest = 0.0;
                    double netIncome = 0.0;
                    double income = 0.0;
                    double expenses = 0.0;
                    num rate = 1;
                    providerdata.investList.forEach((element) {
                      providerdata.currencyData.forEach((element1) {
                        if (element.currency == element1.short) {
                          rate = providerdata.currency.rate / element1.rate;
                          if (element.status != 'FINISHED') {
                            totalInvest = totalInvest + element.amount * rate;
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
                          } else {
                            income = income + element.amount * rate;
                          }
                        }
                      });
                    });
                    if (income >= expenses) {
                      netIncome = income - expenses;
                    } else {
                      netIncome = 0;
                    }

                    return Container(
                        padding: AppTheme.outboxpadding,
                        child: SummaryBox(
                          title1: S.current.Invest + S.current.Account,
                          title2: S.current.Cash + S.current.Account,
                          value1: totalInvest * animation.value,
                          value2: netIncome * animation.value,
                          currency: providerdata.currency.iconName,
                          mark: true,
                        ));
                  })));
        });
  }
}
