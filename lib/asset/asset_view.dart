import 'package:flutter/material.dart';
import 'package:vara/asset/asset_summary.dart';
import 'chart_view.dart';

class AssetView extends StatefulWidget {
  final List<Map> asset;
  final editParentData;
  const AssetView({Key key, this.asset, this.editParentData}) : super(key: key);

  @override
  _AssetViewState createState() => _AssetViewState();
}

class _AssetViewState extends State<AssetView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 268,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            AssetSummaryView(asset: widget.asset),
            ChartView(asset: widget.asset),
          ],
        ));
  }
}
