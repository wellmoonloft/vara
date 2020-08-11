import 'package:flutter/material.dart';
import 'bill_import.dart';
import 'bill_summary.dart';

class BillView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 258,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            BillSummaryView(),
            BillImportView(),
          ],
        ));
  }
}
