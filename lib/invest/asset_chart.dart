import 'dart:async';

import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class InvestChartView extends StatefulWidget {
  @override
  _InvestChartState createState() => _InvestChartState();
}

class _InvestChartState extends State<InvestChartView> {
  bool show = false;
  Timer timer;
  String date = '';
  Map<String, num> number;
  double left = 0.0;
  double top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: AppTheme.outboxpadding,
            child: GestureDetector(
                onTapDown: (TapDownDetails details) {
                  //print(details.localPosition.dx);
                  setState(() {
                    top = details.localPosition.dy;
                    double ofset = MediaQuery.of(context).size.width -
                        details.localPosition.dx;
                    if (ofset < 160) {
                      left = details.localPosition.dx - 125;
                    } else {
                      left = details.localPosition.dx;
                    }
                  });
                },
                child: Container(
                    decoration: AppTheme.boxDecoration,
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 5, left: 15),
                            child: charts.TimeSeriesChart(
                              _createSampleData(context),
                              animate: false,
                              primaryMeasureAxis: charts.NumericAxisSpec(
                                tickFormatterSpec:
                                    new charts.BasicNumericTickFormatterSpec(
                                        (value) => '${value / 1000}M'),
                              ),
                              defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true,
                                includePoints: false,
                                includeLine: true,
                                stacked: false,
                              ),
                              customSeriesRenderers: [
                                new charts.PointRendererConfig(
                                    // ID used to link series to this renderer.
                                    customRendererId: 'customPoint')
                              ],
                              selectionModels: [
                                new charts.SelectionModelConfig(
                                  type: charts.SelectionModelType.info,
                                  changedListener: _onSelectionChanged,
                                )
                              ],
                              dateTimeFactory:
                                  const charts.LocalDateTimeFactory(),
                            )),
                        show
                            ? ShowDetail(
                                date: date,
                                number: number,
                                left: left,
                                top: top,
                              )
                            : Container()
                      ],
                    )))));
  }

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    if (model.selectedSeries == null || model.selectedSeries.length == 0) {
      return;
    }

    String time;
    final measures = <String, num>{};
    if (selectedDatum.isNotEmpty) {
      time = DateFormat('yyyy-MM-dd')
          .format(selectedDatum.first.datum.time)
          .toString();
      selectedDatum.forEach((charts.SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum.sales;
      });
    }

    timer?.cancel();
    setState(() {
      date = time;
      number = measures;
      show = true;
    });
    timer = new Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        show = false;
      });
    });
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData(
      context) {
    List<Invest> invest = Provider.of<ProviderData>(context).investList;
    List<TimeSeriesSales> investIncomeSalesData = [];

    //double assetValue = 0.0;

    if (invest != null) {
      for (var i = 0; i < invest.length; i++) {
        Invest temp = invest[i];
        if (temp.interest > 0) {
          investIncomeSalesData.insert(
              i, TimeSeriesSales(DateTime.parse(temp.endDate), temp.interest));
        }
        // assetValue = assetValue + temp.asset.toDouble();
        // debtValue = debtValue + temp.debt.toDouble();
        // netAssetValue = assetValue - debtValue;
        // investIncomeSalesData.insert(
        //     i, TimeSeriesSales(DateTime.parse(temp.date), assetValue));

      }
    }
    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Asset',
        colorFn: (_, __) => charts.Color.fromHex(code: '#6baeb7'),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: investIncomeSalesData,
      )
    ];
  }
}

class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}

class ShowDetail extends StatelessWidget {
  final String date;
  final Map<String, num> number;
  final double left;
  final double top;
  ShowDetail({this.date, this.number, this.left, this.top});
  @override
  Widget build(BuildContext context) {
    var style = TextStyle(color: Colors.white, fontSize: 12);

    return Positioned(
      left: left,
      top: 80,
      width: 150,
      child: Container(
          color: ColorTheme.black.withOpacity(0.7),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    date,
                    style: style,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Asset: ',
                          style: style,
                        ),
                        Text(
                          number['Asset'].toStringAsFixed(2),
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 165,
                    height: 15,
                    child: Row(
                      children: [
                        Text(
                          'Debt: ',
                          style: style,
                        ),
                        Text(
                          number['Debt'].toStringAsFixed(2),
                          style: style,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 165,
                    height: 15,
                    child: Row(
                      children: [
                        Text(
                          'NetAsset: ',
                          style: style,
                        ),
                        Text(
                          number['NetAsset'].toStringAsFixed(2),
                          style: style,
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
