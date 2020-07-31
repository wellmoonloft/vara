import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/color_theme.dart';

class LineChartView extends StatefulWidget {
  final Map<String, dynamic> btcweek;
  LineChartView({Key key, this.btcweek}) : super(key: key);
  @override
  LineChartViewState createState() => LineChartViewState();
}

class LineChartViewState extends State<LineChartView> {
  List<FlSpot> flspot1 = [FlSpot(0, 0.0)];

  @override
  void initState() {
    for (var i = 0; i < 30; i++) {
      Map<String, dynamic> data = widget.btcweek[DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(new Duration(days: i)))
          .toString()];

      flspot1
          .asMap()
          .entries
          .map((i) =>
              FlSpot(i.key.toDouble(), double.parse(data['4b. close (USD)'])))
          .toList();

      //flspot1.add(FlSpot(i.toDouble(), double.parse(data['4b. close (USD)'])));
    }
    print(flspot1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: LineChart(
              sampleData1(),
              swapAnimationDuration: const Duration(milliseconds: 250),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(tooltipBgColor: Colors.white),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          textStyle: TextStyle(
            color: ColorTheme.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          //margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1';
              case 15:
                return '15';
              case 30:
                return '30';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: ColorTheme.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          // getTitles: (value) {
          //   switch (value.toInt()) {
          //     case 1:
          //       return '1';
          //     case 2:
          //       return '2';
          //     case 3:
          //       return '3';
          //     case 4:
          //       return '5';
          //   }
          //   return '';
          // },
          //margin: 8,
          reservedSize: 20,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: ColorTheme.background,
            width: 2,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: flspot1,
      isCurved: true,
      colors: [
        ColorTheme.debt,
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      colors: [
        ColorTheme.assets,
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );

    return [
      lineChartBarData1,
      lineChartBarData2,
    ];
  }
}
