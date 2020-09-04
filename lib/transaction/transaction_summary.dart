import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
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
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 16, bottom: 20),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, top: 5),
                                            child: Text(
                                                netIncome.abs() > 100000.00
                                                    ? providerdata
                                                            .currency.iconName +
                                                        ' ' +
                                                        NumberFormat.compact(locale: Intl.getCurrentLocale())
                                                            .format(netIncome *
                                                                animation.value)
                                                    : NumberFormat(
                                                            providerdata
                                                                    .currency
                                                                    .iconName +
                                                                " ###,###.00#",
                                                            Intl
                                                                .getCurrentLocale())
                                                        .format(netIncome *
                                                            animation.value),
                                                textAlign: TextAlign.center,
                                                style: setHomeNumnberText(
                                                    ColorTheme.greytripledarker)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: ColorTheme.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100.0),
                                                  ),
                                                  border: new Border.all(
                                                      width: 5,
                                                      color: ColorTheme
                                                          .greenlighter),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 18, left: 18),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.sortUp,
                                                    color:
                                                        ColorTheme.greenlighter,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  S.current.Income,
                                                  textAlign: TextAlign.start,
                                                  style: setNoteTitleSmall(
                                                      ColorTheme.greydarker),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 6, bottom: 6),
                                                  child: Text(
                                                      income.abs() > 100000.00
                                                          ? providerdata
                                                                  .currency
                                                                  .iconName +
                                                              ' ' +
                                                              NumberFormat.compact(
                                                                      locale: Intl
                                                                          .getCurrentLocale())
                                                                  .format(income *
                                                                      animation
                                                                          .value)
                                                          : NumberFormat(
                                                                  providerdata
                                                                          .currency
                                                                          .iconName +
                                                                      " ###,###.00#",
                                                                  Intl.getCurrentLocale())
                                                              .format(income * animation.value),
                                                      textAlign: TextAlign.start,
                                                      style: setNoteTitle(ColorTheme.greytripledarker)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: ColorTheme.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(100.0),
                                                  ),
                                                  border: new Border.all(
                                                      width: 5,
                                                      color: ColorTheme
                                                          .redlighter),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 9, left: 18),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.sortDown,
                                                    color:
                                                        ColorTheme.redlighter,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  S.current.Expenses,
                                                  textAlign: TextAlign.end,
                                                  style: setNoteTitleSmall(
                                                      ColorTheme.greydarker),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 6, bottom: 6),
                                                  child: Text(
                                                      expenses.abs() > 100000.00
                                                          ? providerdata
                                                                  .currency
                                                                  .iconName +
                                                              ' ' +
                                                              NumberFormat.compact(
                                                                      locale: Intl
                                                                          .getCurrentLocale())
                                                                  .format(expenses *
                                                                      animation
                                                                          .value)
                                                          : NumberFormat(
                                                                  providerdata
                                                                          .currency
                                                                          .iconName +
                                                                      " ###,###.00#",
                                                                  Intl.getCurrentLocale())
                                                              .format(expenses * animation.value),
                                                      textAlign: TextAlign.end,
                                                      style: setNoteTitle(ColorTheme.greytripledarker)),
                                                ),
                                              ],
                                            )
                                          ],
                                        ))
                                  ])
                            ],
                          ),
                        ));
                  })));
        });
  }
}
