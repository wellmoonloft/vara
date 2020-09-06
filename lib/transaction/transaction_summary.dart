import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';

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
                    //double freedomService = 0.0;
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
                    // if (expenses == 0 || income == 0) {
                    //   freedomService = 0;
                    // } else {
                    //   freedomService = income / expenses * 100;
                    // }

                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 20),
                          child: Column(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, bottom: 2),
                                    child: Text(S.current.Income,
                                        textAlign: TextAlign.center,
                                        style: AppTheme.noteTitle),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: NumbersText(
                                          value: netIncome * animation.value,
                                          style: AppTheme.mainNumbers,
                                          currency:
                                              providerdata.currency.iconName)),
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              SummaryBox(
                                title1: S.current.Income,
                                title2: S.current.Expenses,
                                value1: income * animation.value,
                                value2: expenses * animation.value,
                                currency: providerdata.currency.iconName,
                                mark: false,
                              ),
                            ],
                          ),
                        ));
                  })));
        });
  }
}
