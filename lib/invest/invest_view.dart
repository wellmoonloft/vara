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
        height: 280,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            InvestSummaryView(investList: widget.investList),
            InvestImportView(),
            //ChartView(asset: widget.asset),
            // new Container(
            //   width: 160.0,
            //   color: Colors.green,
            //   child: Text('3'),
            // ),
            // new Container(
            //   width: 160.0,
            //   color: Colors.yellow,
            //   child: Text('4'),
            // ),
            // new Container(
            //   width: 160.0,
            //   color: Colors.orange,
            //   child: Text('5'),
            // ),
          ],
        ));
  }
}
