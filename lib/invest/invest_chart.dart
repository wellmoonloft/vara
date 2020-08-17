import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/provider_data.dart';

class InvestChart extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  InvestChart({this.animation, this.animationController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
              opacity: animation,
              child: Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation.value), 0.0),
                  child: Container(
                      height: 330,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 24, right: 10, top: 10, bottom: 15),
                          child: charts.ScatterPlotChart(
                            _createSampleData(context),
                            animate: false,
                            // selectionModels: [
                            //   charts.SelectionModelConfig(
                            //       type: charts.SelectionModelType.info,
                            //       changedListener: (SelectionModel model) {
                            //         if (model.hasDatumSelection) {
                            //           model.selectedDatum.forEach((element) {
                            //             print(element);
                            //           });
                            //         }
                            //       })
                            // ],
                          )))));
        });
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData(context) {
    List<Invest> invest = Provider.of<ProviderData>(context).investList;
    List<LinearSales> data = [];
    if (invest != null) {
      int x = 0;
      for (var i = 0; i < invest.length; i++) {
        Invest temp = invest[i];
        if (temp.status == 'LATE') {
          var perDate = DateTime.parse(temp.perDate);
          var endDate = DateTime.parse(temp.endDate);
          var daydifree = perDate.difference(endDate);
          data.insert(
              x, LinearSales(daydifree.inDays, temp.amount, temp.amount / 20));
          x++;
        }
      }
    }

    final maxMeasure = 10.00;

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',

        colorFn: (LinearSales sales, _) {
          final bucket = sales.year / maxMeasure;

          if (bucket < 1 / 3) {
            return charts.Color.fromHex(code: '#6baeb7');
          } else if (bucket < 2 / 3) {
            return charts.Color.fromHex(code: '#c79ba6');
          } else {
            return charts.Color.fromHex(code: '#ff6a4e');
          }
        },
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        // Providing a radius function is optional.
        radiusPxFn: (LinearSales sales, _) => sales.radius,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final num sales;
  final double radius;

  LinearSales(this.year, this.sales, this.radius);
}
