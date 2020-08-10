import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/utils/app_theme.dart';
import 'package:vara/utils/color_theme.dart';

import 'package:vara/utils/toolTipMgr.dart';

class AssetChartView extends StatelessWidget {
  static String pointerValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.only(
                left: AppTheme.leftRightPadding,
                right: AppTheme.leftRightPadding,
                top: 18,
                bottom: 20),
            child: Container(
                decoration: BoxDecoration(
                  color: ColorTheme.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: ColorTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 5, left: 15),
                          child: charts.TimeSeriesChart(
                            _createSampleData(context),
                            animate: false,
                            defaultRenderer: new charts.LineRendererConfig(),
                            customSeriesRenderers: [
                              new charts.PointRendererConfig(
                                  // ID used to link series to this renderer.
                                  customRendererId: 'customPoint')
                            ],
                            behaviors: [
                              new charts.LinePointHighlighter(
                                  symbolRenderer: CustomCircleSymbolRenderer()),
                              new charts.SelectNearest(
                                  eventTrigger:
                                      charts.SelectionTrigger.tapAndDrag)
                            ],
                            selectionModels: [
                              charts.SelectionModelConfig(changedListener:
                                  (charts.SelectionModel model) {
                                if (model.hasDatumSelection) {
                                  ToolTipMgr.setTitle({
                                    'title':
                                        //'${model.selectedSeries[0].measureFn(model.selectedDatum[0].datum.sales)}',
                                        '${model.selectedDatum[0].datum.sales}',
                                    'subTitle':
                                        '${model.selectedDatum[1].datum.sales}'
                                  });
                                  print({
                                    //model.selectedSeries[0].measureFn(
                                    model.selectedDatum[0].datum.sales
                                    //)
                                  });
                                }
                              })
                            ],
                            dateTimeFactory:
                                const charts.LocalDateTimeFactory(),
                          )),
                    ),
                  ],
                ))));
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData(
      context) {
    List<Map> asset = Provider.of<InvestData>(context).assetList;
    List<TimeSeriesSales> assetSalesData = [];
    List<TimeSeriesSales> investSalesData = [];
    List<TimeSeriesSales> netAssetSalesData = [];
    double assetValue = 0.0;
    double debtValue = 0.0;
    double netAssetValue = 0.0;
    for (var i = 0; i < asset.length; i++) {
      Map<String, dynamic> temp = asset[asset.length - i - 1];
      assetValue = assetValue + temp['asset'].toDouble();
      debtValue = debtValue + temp['debt'].toDouble();
      netAssetValue = assetValue - debtValue;
      assetSalesData.insert(
          i, TimeSeriesSales(DateTime.parse(temp['date']), assetValue));
      investSalesData.insert(
          i, TimeSeriesSales(DateTime.parse(temp['date']), debtValue));
      netAssetSalesData.insert(
          i, TimeSeriesSales(DateTime.parse(temp['date']), netAssetValue));
    }

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Asset',
        colorFn: (_, __) => charts.Color.fromHex(code: '#6baeb7'),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: assetSalesData,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Debt',
        colorFn: (_, __) => charts.Color.fromHex(code: '#AD6E7D'),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: investSalesData,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
          id: 'NetAsset',
          colorFn: (_, __) => charts.Color.fromHex(code: '#ff320b'),
          domainFn: (TimeSeriesSales sales, _) => sales.time,
          measureFn: (TimeSeriesSales sales, _) => sales.sales,
          data: netAssetSalesData)
      // Configure our custom point renderer for this series.
      //..setAttribute(charts.rendererIdKey, 'customPoint'),
    ];
  }
}

class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}
