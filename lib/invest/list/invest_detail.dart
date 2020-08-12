import 'package:flutter/material.dart';
import 'package:vara/utils/app_ui.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/app_theme.dart';
import 'package:vara/utils/toolkit.dart';

class InvestDetail extends StatelessWidget {
  final Map<dynamic, dynamic> investdetail;

  const InvestDetail({Key key, this.investdetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: ColorTheme.white,
          elevation: 0,
          title: Text('Invest Detail', style: AppTheme.titleText),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 20,
              color: ColorTheme.greytripledarker,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
            color: ColorTheme.white,
            child: ListView(children: [
              ListDetail(
                  title: 'Invest Code:', value: investdetail['investcode']),
              ListDetail(
                  title: 'Invest Time:', value: investdetail['investtime']),
              ListDetail(
                  title: 'Plan payment time:', value: investdetail['pertime']),
              ListDetail(
                  title: 'Final Payment Time:', value: investdetail['endtime']),
              ListDetail(
                  title: 'Invest Amount:',
                  value: '€ ' +
                      formatNum(investdetail['investamount'], 2).toString()),
              ListDetail(
                  title: 'Received:',
                  value:
                      '€ ' + formatNum(investdetail['received'], 2).toString()),
              ListDetail(
                  title: 'Interest:',
                  value:
                      '€ ' + formatNum(investdetail['interest'], 2).toString()),
              ListDetail(
                  title: 'totalyield:',
                  value: formatNum(investdetail['totalyield'], 2).toString() +
                      '%'),
              ListDetail(title: 'Status:', value: investdetail['status']),
              ListDetail(title: 'Currency:', value: investdetail['currency']),
              ListDetail(title: 'Country:', value: investdetail['country']),
            ])));
  }
}
