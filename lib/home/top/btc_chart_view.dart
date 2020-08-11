import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BtcChartView extends StatelessWidget {
  final Map<String, dynamic> btcdaily;
  final bool animate;

  BtcChartView({Key key, this.btcdaily, this.animate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: _createSampleData() == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 5, left: 15),
                  child: charts.TimeSeriesChart(
                    _createSampleData(),
                    primaryMeasureAxis: charts.NumericAxisSpec(
                      renderSpec: charts.GridlineRendererSpec(
                          axisLineStyle: charts.LineStyleSpec(
                            color: charts.MaterialPalette.white,
                          ),
                          labelStyle: new charts.TextStyleSpec(
                            fontSize: 10,
                            color: charts.MaterialPalette.white,
                          ),
                          lineStyle: charts.LineStyleSpec(
                            thickness: 0,
                            color: charts.MaterialPalette.white,
                          )),
                    ),
                    domainAxis: charts.DateTimeAxisSpec(
                        renderSpec: charts.GridlineRendererSpec(
                            axisLineStyle: charts.LineStyleSpec(
                              color: charts.MaterialPalette.white,
                            ),
                            labelStyle: charts.TextStyleSpec(
                                fontSize: 10,
                                color: charts.MaterialPalette.white),
                            lineStyle: charts.LineStyleSpec(
                                thickness: 0,
                                color: charts.MaterialPalette.white))),
                    animate: false,
                  )),
        ),
      ],
    );
  }

  List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    List<TimeSeriesSales> data = [];
    if (btcdaily != null) {
      for (var i = 0; i < btcdaily.length; i++) {
        Map<String, dynamic> data1 = btcdaily[DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(new Duration(days: i)))
            .toString()];

        data.add(new TimeSeriesSales(
            DateTime.now().subtract(new Duration(days: i)),
            double.parse(data1['4b. close (USD)'])));
        //print(double.parse(data1['4b. close (USD)']));
      }

      return [
        new charts.Series<TimeSeriesSales, DateTime>(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (TimeSeriesSales sales, _) => sales.time,
          measureFn: (TimeSeriesSales sales, _) => sales.sales,
          data: data,
        )
      ];
    }
    return null;
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}
