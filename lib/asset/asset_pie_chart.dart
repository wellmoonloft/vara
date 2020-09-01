import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/default_data.dart';
import 'package:vara/models/provider_data.dart';

class AssetPieChartView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  AssetPieChartView({Key key, this.animationController, this.animation})
      : super(key: key);

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
                      padding: EdgeInsets.only(
                          left: 0, right: 20, top: 30, bottom: 20),
                      height: 380,
                      child: charts.BarChart(_createSampleData(context),
                          animate: true,
                          domainAxis: charts.OrdinalAxisSpec(
                            renderSpec: charts.SmallTickRendererSpec(
                              labelOffsetFromAxisPx: 12,
                              labelStyle: charts.TextStyleSpec(
                                color: charts.MaterialPalette.black,
                                fontSize: 12,
                              ),
                              lineStyle: charts.LineStyleSpec(
                                  thickness: 0,
                                  color: charts.MaterialPalette.white),
                              axisLineStyle: charts.LineStyleSpec(
                                thickness: 3,
                                color: charts.Color.fromHex(code: '#6baeb7'),
                              ),
                            ),
                          ),
                          primaryMeasureAxis: charts.NumericAxisSpec(
                              renderSpec: charts.NoneRenderSpec()),
                          barGroupingType: charts.BarGroupingType.grouped,
                          behaviors: [
                            new charts.SeriesLegend(
                              defaultHiddenSeries: ['Other'],
                            )
                          ],
                          selectionModels: [
                            charts.SelectionModelConfig(
                                type: charts.SelectionModelType.info,
                                changedListener: (SelectionModel model) {
                                  if (model.hasDatumSelection) {
                                    // final measures = <String, num>{};

                                    // model.selectedDatum.forEach(
                                    //     (charts.SeriesDatum datumPair) {
                                    //   measures[datumPair.series.displayName] =
                                    //       datumPair.datum.sales;
                                    // });
                                  }
                                })
                          ]))));
        });
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData(context) {
    List<Asset> assetList = Provider.of<ProviderData>(context).assetList;
    List<CurrencyData> currencyData =
        Provider.of<ProviderData>(context).currencyData;
    List<OrdinalSales> assetSalesData = [];
    List<OrdinalSales> debtSalesData = [];

    num rate = Provider.of<ProviderData>(context).currency.rate;
    if (assetList != null) {
      int y = 0;
      int x = 0;

      currencyData.forEach((element) {
        double assetValue = 0.0;
        double debtValue = 0.0;

        for (var i = 0; i < assetList.length; i++) {
          Asset temp = assetList[i];
          if (element.short == temp.currency) {
            rate = rate / element.rate;
            assetValue = assetValue + temp.asset.toDouble() * rate;
            debtValue = debtValue + temp.debt.toDouble() * rate;
          }
        }

        if (assetValue != 0) {
          assetSalesData.insert(x, OrdinalSales(element.short, assetValue));
          x++;
        }
        if (debtValue != 0) {
          debtSalesData.insert(y, OrdinalSales(element.short, debtValue));
          y++;
        }
      });
    }

    return [
      new charts.Series<OrdinalSales, String>(
        id: S.current.Asset,
        colorFn: (_, __) => charts.Color.fromHex(code: '#c79ba6'),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: assetSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: S.current.Debt,
        colorFn: (_, __) => charts.Color.fromHex(code: '#ff6a4e'),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: debtSalesData,
      ),
    ];
  }
}

class OrdinalSales {
  final String year;
  final double sales;

  OrdinalSales(this.year, this.sales);
}