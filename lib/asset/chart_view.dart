import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:vara/utils/app_theme.dart';
import 'package:vara/utils/color_theme.dart';

class ChartView extends StatelessWidget {
  final List<Map> asset;
  final bool animate;

  ChartView({Key key, this.asset, this.animate}) : super(key: key);

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
                            _createSampleData(),
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

  List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    List<TimeSeriesSales> data = [];
    for (var i = 0; i < asset.length; i++) {
      Map<String, dynamic> data1 = asset[asset.length - i - 1];
      //print(asset[i]);
      data.add(new TimeSeriesSales(
          DateTime.now().subtract(new Duration(days: i)),
          data1['asset'].toDouble()));
    }

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        //colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        colorFn: (_, __) => charts.Color.fromHex(code: '#6baeb7'),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}
