import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class AssetChartView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const AssetChartView({Key key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ChartData(),
        child: AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) {
              return FadeTransition(
                  opacity: animation,
                  child: Transform(
                      transform: new Matrix4.translationValues(
                          0.0, 30 * (1.0 - animation.value), 0.0),
                      child: Container(
                          height: 300,
                          child: Container(
                              child: Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              charts.TimeSeriesChart(
                                _createSampleData(context),
                                animate: true,

                                primaryMeasureAxis: charts.NumericAxisSpec(
                                    renderSpec: charts.NoneRenderSpec()),
                                // primaryMeasureAxis: charts.NumericAxisSpec(
                                //   tickFormatterSpec:
                                //       new charts.BasicNumericTickFormatterSpec(
                                //           (value) => '${value / 1000}M'),
                                defaultRenderer: charts.LineRendererConfig(
                                    includeArea: true,
                                    includePoints: false,
                                    includeLine: true,
                                    stacked: false,
                                    strokeWidthPx: 3),
                                selectionModels: [
                                  charts.SelectionModelConfig(
                                      type: charts.SelectionModelType.info,
                                      changedListener: (SelectionModel model) {
                                        if (model.hasDatumSelection) {
                                          var chartData =
                                              Provider.of<ChartData>(context,
                                                  listen: false);
                                          final measures = <String, num>{};
                                          String time = '';
                                          model.selectedDatum.forEach(
                                              (charts.SeriesDatum datumPair) {
                                            measures[datumPair
                                                    .series.displayName] =
                                                datumPair.datum.sales;
                                          });
                                          time = DateFormat('yyyy-MM-dd')
                                              .format(model.selectedDatum.first
                                                  .datum.time)
                                              .toString();
                                          chartData.setDate(time);
                                          chartData.setNumber(measures);
                                        }
                                      })
                                ],
                                dateTimeFactory:
                                    const charts.LocalDateTimeFactory(),
                              ),
                              ShowDetail()
                            ],
                          )))));
            }));
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData(
      context) {
    List<Asset> asset = Provider.of<ProviderData>(context).assetList;
    List<TimeSeriesSales> assetSalesData = [];
    List<TimeSeriesSales> investSalesData = [];
    List<TimeSeriesSales> netAssetSalesData = [];
    double assetValue = 0.0;
    double debtValue = 0.0;
    double netAssetValue = 0.0;
    if (asset != null) {
      for (var i = 0; i < asset.length; i++) {
        Asset temp = asset[i];
        assetValue = assetValue + temp.asset.toDouble();
        debtValue = debtValue + temp.debt.toDouble();
        netAssetValue = assetValue - debtValue;
        assetSalesData.insert(
            i, TimeSeriesSales(DateTime.parse(temp.date), assetValue));
        investSalesData.insert(
            i, TimeSeriesSales(DateTime.parse(temp.date), debtValue));
        netAssetSalesData.insert(
            i, TimeSeriesSales(DateTime.parse(temp.date), netAssetValue));
      }
    }
    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Asset',
        colorFn: (_, __) => charts.Color.fromHex(code: '#c79ba6'),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: assetSalesData,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Debt',
        colorFn: (_, __) => charts.Color.fromHex(code: '#ff6a4e'),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: investSalesData,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
          id: 'NetAsset',
          colorFn: (_, __) => charts.Color.fromHex(code: '#6baeb7'),
          domainFn: (TimeSeriesSales sales, _) => sales.time,
          measureFn: (TimeSeriesSales sales, _) => sales.sales,
          data: netAssetSalesData)
    ];
  }
}

class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}

class ShowDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 24,
        top: 24,
        width: 150,
        child: Consumer<ChartData>(builder: (context, providerdata, child) {
          return providerdata.date == null
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.puristbluedarker.withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Consumer<ChartData>(
                          builder: (context, providerdata, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              providerdata.date == null
                                  ? 'Date'
                                  : providerdata.date,
                              style: AppTheme.chartText,
                            ),
                            Text(
                              providerdata.number == null
                                  ? 'Asset: 0'
                                  : 'Asset: ' +
                                      providerdata.number['Asset']
                                          .toStringAsFixed(2),
                              style: AppTheme.chartText,
                            ),
                            Text(
                              providerdata.number == null
                                  ? 'Debt: 0'
                                  : 'Debt: ' +
                                      providerdata.number['Debt']
                                          .toStringAsFixed(2),
                              style: AppTheme.chartText,
                            ),
                            Text(
                              providerdata.number == null
                                  ? 'NetAsset: 0'
                                  : 'NetAsset: ' +
                                      providerdata.number['NetAsset']
                                          .toStringAsFixed(2),
                              style: AppTheme.chartText,
                            )
                          ],
                        );
                      })));
        }));
  }
}

class ChartData extends ChangeNotifier {
  String date;
  Map<String, num> number;

  setDate(time) {
    date = time;
    notifyListeners();
  }

  setNumber(measures) {
    number = measures;
    notifyListeners();
  }
}
