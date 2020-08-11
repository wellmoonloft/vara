import 'package:flutter/material.dart';
import 'package:vara/asset/asset_summary.dart';
import 'asset_chart.dart';

class AssetView extends StatefulWidget {
  const AssetView({Key key}) : super(key: key);

  @override
  _AssetViewState createState() => _AssetViewState();
}

class _AssetViewState extends State<AssetView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 255,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            AssetSummaryView(),
            AssetChartView(),
          ],
        ));
  }
}
