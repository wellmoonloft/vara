import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/utils/app_theme.dart';
import 'package:vara/utils/color_theme.dart';

class ChartView extends StatelessWidget {
  final bool animate;

  ChartView({Key key, this.animate}) : super(key: key);

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
                            primaryMeasureAxis: charts.NumericAxisSpec(
                              renderSpec: charts.GridlineRendererSpec(
                                  axisLineStyle: charts.LineStyleSpec(
                                    color: charts.MaterialPalette.black,
                                  ),
                                  labelStyle: new charts.TextStyleSpec(
                                    fontSize: 10,
                                    color: charts.MaterialPalette.black,
                                  ),
                                  lineStyle: charts.LineStyleSpec(
                                    thickness: 0,
                                    color: charts.MaterialPalette.black,
                                  )),
                            ),
                            domainAxis: charts.DateTimeAxisSpec(
                                renderSpec: charts.GridlineRendererSpec(
                                    axisLineStyle: charts.LineStyleSpec(
                                      color: charts.MaterialPalette.black,
                                    ),
                                    labelStyle: charts.TextStyleSpec(
                                        fontSize: 10,
                                        color: charts.MaterialPalette.black),
                                    lineStyle: charts.LineStyleSpec(
                                        thickness: 0,
                                        color: charts.MaterialPalette.black))),
                            animate: false,
                          )),
                    ),
                  ],
                ))));
  }

  List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData(context) {
    List<TimeSeriesSales> assetdata = [];
    List<TimeSeriesSales> debtdata = [];
    List<Map> asset = Provider.of<InvestData>(context).assetList;
    for (var i = 0; i < asset.length; i++) {
      Map<String, dynamic> temp = asset[asset.length - i - 1];
      //print(asset[i]);
      assetdata.add(new TimeSeriesSales(
          DateTime.now().subtract(new Duration(days: i)),
          temp['asset'].toDouble()));
      debtdata.add(new TimeSeriesSales(
          DateTime.now().subtract(new Duration(days: i)),
          temp['asset'].toDouble()));
    }

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'asset',
        //colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        colorFn: (_, __) => charts.Color.fromHex(code: '#6baeb7'),
        domainFn: (TimeSeriesSales asset, _) => asset.time,
        measureFn: (TimeSeriesSales asset, _) => asset.numbers,
        data: assetdata,
      ),
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'debt',
        //colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        colorFn: (_, __) => charts.Color.fromHex(code: '#ff6a4e'),
        domainFn: (TimeSeriesSales debt, _) => debt.time,
        measureFn: (TimeSeriesSales debt, _) => debt.numbers,
        data: debtdata,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final double numbers;

  TimeSeriesSales(this.time, this.numbers);
}
