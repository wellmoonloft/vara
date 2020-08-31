import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import 'settings_view.dart';

class MineHome extends StatelessWidget {
  final AnimationController animationController;

  const MineHome({Key key, this.animationController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              brightness: Brightness.light,
              leading: IconButton(
                  icon: FaIcon(FontAwesomeIcons.cog),
                  iconSize: 20,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SettingsView();
                    })).then((data) {
                      if (data != null) {}
                    });
                  }),
              backgroundColor: ColorTheme.puristbluedarker,
              expandedHeight: 200.0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: Text(''),
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                    height: 80,
                    width: 200,
                    child: Column(children: <Widget>[
                      Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorTheme.white,
                            shape: BoxShape.circle,
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.userAlt,
                            color: ColorTheme.grey,
                          )),
                      Consumer<ProviderData>(
                          builder: (context, providerdata, child) {
                        return Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              providerdata.person.firstname,
                              style: AppTheme.toptitleText,
                            ));
                      })
                    ])),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [ColorTheme.cantaloupe, ColorTheme.cassis],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(<Widget>[
              Consumer<ProviderData>(builder: (context, providerdata, child) {
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
                    padding: EdgeInsets.only(top: AppTheme.leftRightPadding),
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
                                                color: ColorTheme.cantaloupe,
                                                width: 3,
                                                height: 50),
                                            SummaryTopTitile(
                                              title: S.current.NetIncome,
                                              value: netIncome.abs() > 100000.00
                                                  ? providerdata
                                                          .currency.iconName +
                                                      ' ' +
                                                      NumberFormat.compact(
                                                              locale: Intl
                                                                  .getCurrentLocale())
                                                          .format(netIncome)
                                                  : NumberFormat(
                                                          providerdata.currency
                                                                  .iconName +
                                                              " ###,###.0#",
                                                          Intl.getCurrentLocale())
                                                      .format(netIncome),
                                              color:
                                                  ColorTheme.cantaloupedarker,
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
                                      value: freedomService,
                                      color: ColorTheme.cantaloupe,
                                      subcolor: ColorTheme.cantaloupelighter,
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
              }),
              Consumer<ProviderData>(builder: (context, providerdata, child) {
                double income = 0.0;
                double expenses = 0.0;
                num rate = 1;

                if (providerdata.billList != null) {
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
                }
                return Row(children: <Widget>[
                  Padding(
                    padding: AppTheme.chartTitlepadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          S.current.Income,
                          textAlign: TextAlign.start,
                          style: AppTheme.titleTextSmallLighter,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          child: Text(
                              income > 100000.00
                                  ? providerdata.currency.iconName +
                                      ' ' +
                                      NumberFormat.compact(
                                              locale: Intl.getCurrentLocale())
                                          .format(income)
                                  : NumberFormat(
                                          providerdata.currency.iconName +
                                              " ###,###.0#",
                                          Intl.getCurrentLocale())
                                      .format(income),
                              textAlign: TextAlign.start,
                              style: setHomeNumnberText(
                                  ColorTheme.puristbluedarker)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppTheme.chartTitlepadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          S.current.Expenses,
                          textAlign: TextAlign.end,
                          style: AppTheme.titleTextSmallLighter,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          child: Text(
                              expenses > 100000.00
                                  ? providerdata.currency.iconName +
                                      ' ' +
                                      NumberFormat.compact(
                                              locale: Intl.getCurrentLocale())
                                          .format(expenses)
                                  : NumberFormat(
                                          providerdata.currency.iconName +
                                              " ###,###.0#",
                                          Intl.getCurrentLocale())
                                      .format(expenses),
                              textAlign: TextAlign.end,
                              style: setHomeNumnberText(ColorTheme.cassis)),
                        ),
                      ],
                    ),
                  )
                ]);
              }),
              // Container(
              //   child: Text('data'),
              // ),
              // Container(
              //   child: Text('data'),
              // ),
            ]))
          ],
        ));
  }
}
