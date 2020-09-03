import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/provider_data.dart';

class TransactionChart extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  TransactionChart({this.animationController, this.animation});

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
                  child: Consumer<ProviderData>(
                      builder: (context, providerdata, child) {
                    return Container(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                        height: 500,
                        child: charts.BarChart(
                          _createSampleData(context),
                          animate: false,
                          vertical: false,
                          domainAxis: charts.OrdinalAxisSpec(
                            renderSpec: charts.SmallTickRendererSpec(
                              lineStyle: charts.LineStyleSpec(
                                  thickness: 0,
                                  color: charts.MaterialPalette.white),
                            ),
                          ),
                          primaryMeasureAxis: charts.NumericAxisSpec(
                              renderSpec: charts.NoneRenderSpec()),
                          barGroupingType: charts.BarGroupingType.grouped,
                          behaviors: [
                            new charts.SeriesLegend(
                              //position: charts.BehaviorPosition.top,
                              horizontalFirst: false,
                              cellPadding:
                                  new EdgeInsets.only(right: 0.0, bottom: 0.0),
                              showMeasures: true,
                              measureFormatter: (num value) {
                                return value == null
                                    ? '-'
                                    : providerdata.currency.iconName +
                                        ' ' +
                                        NumberFormat.compact(
                                                locale: Intl.getCurrentLocale())
                                            .format(value);
                              },
                            ),
                          ],
                        ));
                  })));
        });
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData(context) {
    // List<Bill> billList = Provider.of<ProviderData>(context).billList;
    // List<OrdinalSales> netIncomeData = [];
    // List<OrdinalSales> incomeData = [];
    // List<OrdinalSales> expensesData = [];
    // billList.forEach((element) {
    //   //element.date
    // });

    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tabletSalesData = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: S.current.NetIncome,
        colorFn: (_, __) => charts.Color.fromHex(code: '#c79ba6'),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: S.current.Income,
        colorFn: (_, __) => charts.Color.fromHex(code: '#ff6a4e'),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tabletSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: S.current.Expenses,
        colorFn: (_, __) => charts.Color.fromHex(code: '#6baeb7'),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final double sales;

  OrdinalSales(this.year, this.sales);
}
