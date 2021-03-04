import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';

class InvestListDetail extends StatelessWidget {
  final Invest investdetail;
  const InvestListDetail({Key key, this.investdetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: ColorTheme.white,
          elevation: 0,
          title: Text(S.current.InvestDetail, style: AppTheme.subPageTitle),
          leading: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 18,
                color: ColorTheme.mainBlack,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
            color: ColorTheme.white,
            child: ListView(children: [
              ListDetail(
                  title: S.current.InvestCode + ':', value: investdetail.code),
              ListDetail(title: S.current.Date + ':', value: investdetail.date),
              ListDetail(
                  title: S.current.PlanPaymentDate + ':',
                  value: investdetail.perDate),
              ListDetail(
                  title: S.current.FinalPaymentDate + ':',
                  value: investdetail.endDate),
              ListDetail(
                  title: S.current.Amount + ':',
                  value: NumberFormat(" ###,##0.00#", Intl.getCurrentLocale())
                          .format(investdetail.amount) +
                      ' ' +
                      investdetail.currency),
              ListDetail(
                  title: S.current.Received + ':',
                  value: NumberFormat(" ###,##0.00", Intl.getCurrentLocale())
                          .format(investdetail.received) +
                      ' ' +
                      investdetail.currency),
              ListDetail(
                  title: S.current.Interest + ':',
                  value: NumberFormat(" ###,##0.00", Intl.getCurrentLocale())
                          .format(investdetail.interest) +
                      ' ' +
                      investdetail.currency),
              ListDetail(
                  title: S.current.TotalYieldYear + ':',
                  value:
                      (investdetail.totalyield * 100).toStringAsFixed(2) + '%'),
              ListDetail(
                  title: S.current.Status + ':', value: investdetail.status),
              ListDetail(
                  title: S.current.Currency + ':',
                  value: investdetail.currency),
              ListDetail(
                  title: S.current.Country + ':', value: investdetail.country),
            ])));
  }
}
