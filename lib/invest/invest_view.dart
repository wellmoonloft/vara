import 'package:flutter/material.dart';
import 'invest_import.dart';
import 'invest_summary.dart';

class InvestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 322,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            InvestSummaryView(), //
            InvestImportView(), //
          ],
        ));
  }
}
