import 'package:flutter/material.dart';
import 'invest_import.dart';
import 'invest_summary.dart';

class InvestView extends StatefulWidget {
  final List<Map> investList;
  const InvestView({Key key, this.investList}) : super(key: key);

  @override
  _AssetViewState createState() => _AssetViewState();
}

class _AssetViewState extends State<InvestView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            InvestSummaryView(investList: widget.investList),
            InvestImportView(),
          ],
        ));
  }
}
