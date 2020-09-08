import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';

class BillDetail extends StatelessWidget {
  final Bill billdetail;
  const BillDetail({Key key, this.billdetail}) : super(key: key);

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
              ListDetail(title: S.current.Date + ':', value: billdetail.date),
              ListDetail(
                  title: S.current.Amount + ':',
                  value: (billdetail.mark == 1 ? '+' : '-') +
                      NumberFormat(" ###,##0.00#", Intl.getCurrentLocale())
                          .format(billdetail.amount) +
                      ' ' +
                      billdetail.currency),
              ListDetail(
                  title: S.current.Category + ':', value: billdetail.categroy),
              ListDetail(title: S.current.Use + ':', value: billdetail.use),
              ListDetail(
                  title: S.current.Currency + ':', value: billdetail.currency),
            ])));
  }
}
