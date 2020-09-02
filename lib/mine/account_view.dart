import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

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
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: AppTheme.outboxpadding,
                                decoration: BoxDecoration(
                                  color: ColorTheme.cassis.withOpacity(0.6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      padding: EdgeInsets.only(
                                          left: 0, right: 30, top: 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            S.current.Invest +
                                                S.current.Account,
                                            style: AppTheme.toptitleBigText,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            totalInvest.abs() > 100000.00
                                                ? providerdata
                                                        .currency.iconName +
                                                    ' ' +
                                                    NumberFormat.compact(
                                                            locale: Intl
                                                                .getCurrentLocale())
                                                        .format(totalInvest *
                                                            animation.value)
                                                : NumberFormat(
                                                        providerdata.currency
                                                                .iconName +
                                                            " ###,###.0#",
                                                        Intl.getCurrentLocale())
                                                    .format(totalInvest *
                                                        animation.value),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: -1.0,
                                              fontSize: 26,
                                              color: ColorTheme.white,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: -10,
                                      child: IconButton(
                                          icon: FaIcon(
                                            FontAwesomeIcons.plus,
                                            size: 16,
                                            color: ColorTheme.white,
                                          ),
                                          onPressed: null),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: AppTheme.outboxpadding,
                                decoration: BoxDecoration(
                                  color: ColorTheme.cantaloupelighter,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      padding: EdgeInsets.only(
                                          left: 0, right: 30, top: 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            S.current.Cash + S.current.Account,
                                            style: AppTheme.toptitleBigText,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            netIncome.abs() > 100000.00
                                                ? providerdata
                                                        .currency.iconName +
                                                    ' ' +
                                                    NumberFormat.compact(
                                                            locale: Intl
                                                                .getCurrentLocale())
                                                        .format(netIncome *
                                                            animation.value)
                                                : NumberFormat(
                                                        providerdata.currency
                                                                .iconName +
                                                            " ###,###.0#",
                                                        Intl.getCurrentLocale())
                                                    .format(netIncome *
                                                        animation.value),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: -1.0,
                                              fontSize: 26,
                                              color: ColorTheme.white,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: -14,
                                      right: -10,
                                      child: IconButton(
                                          icon: FaIcon(
                                            FontAwesomeIcons.plus,
                                            size: 16,
                                            color: ColorTheme.white,
                                          ),
                                          onPressed: null),
                                    ),
                                  ],
                                ),
                              )
                            ]));
                  })));
        });
  }
}
