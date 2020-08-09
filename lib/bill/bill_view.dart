import 'package:flutter/material.dart';

import 'bill_import.dart';
import 'bill_summary.dart';

class BillView extends StatefulWidget {
  const BillView({Key key}) : super(key: key);
  @override
  _AssetViewState createState() => _AssetViewState();
}

class _AssetViewState extends State<BillView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 268,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            BillSummaryView(),
            BillImportView(),
          ],
        ));
  }
}
