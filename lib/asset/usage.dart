// import 'package:Varad/pages/asset/indicator.dart';
// import 'package:Varad/utils/colors_theme.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class UsageView extends StatelessWidget {
//   final AnimationController animationController;
//   final Animation animation;

//   const UsageView({Key key, this.animationController, this.animation})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animationController,
//       builder: (BuildContext context, Widget child) {
//         return FadeTransition(
//           opacity: animation,
//           child: new Transform(
//             transform: new Matrix4.translationValues(
//                 0.0, 30 * (1.0 - animation.value), 0.0),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 24, right: 24, top: 20, bottom: 0),
//                   child: Center(
//                     child: Stack(
//                       overflow: Overflow.visible,
//                       children: <Widget>[
//                         PieChartSample1(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class PieChartSample1 extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => PieChart2State();
// }

// class PieChart2State extends State {
//   int touchedIndex;

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.4,
//       child: Container(
//         decoration: BoxDecoration(
//           color: ColorTheme.white,
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//                 color: ColorTheme.grey.withOpacity(0.2),
//                 offset: Offset(1.1, 1.1),
//                 blurRadius: 10.0),
//           ],
//         ),
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: AspectRatio(
//                 aspectRatio: 1,
//                 child: PieChart(
//                   PieChartData(
//                       pieTouchData:
//                           PieTouchData(touchCallback: (pieTouchResponse) {
//                         setState(() {
//                           if (pieTouchResponse.touchInput is FlLongPressEnd ||
//                               pieTouchResponse.touchInput is FlPanEnd) {
//                             touchedIndex = -1;
//                           } else {
//                             touchedIndex = pieTouchResponse.touchedSectionIndex;
//                           }
//                         });
//                       }),
//                       borderData: FlBorderData(
//                         show: false,
//                       ),
//                       sectionsSpace: 0,
//                       centerSpaceRadius: 40,
//                       sections: showingSections()),
//                 ),
//               ),
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const <Widget>[
//                 Indicator(
//                   color: Color(0xff0293ee),
//                   text: 'Current',
//                   isSquare: true,
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Indicator(
//                   color: Color(0xfff8b250),
//                   text: 'Within month',
//                   isSquare: true,
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Indicator(
//                   color: Color(0xff845bef),
//                   text: 'Within year',
//                   isSquare: true,
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Indicator(
//                   color: Color(0xff13d38e),
//                   text: 'Long term',
//                   isSquare: true,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               width: 28,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<PieChartSectionData> showingSections() {
//     return List.generate(4, (i) {
//       final isTouched = i == touchedIndex;
//       final double fontSize = isTouched ? 25 : 16;
//       final double radius = isTouched ? 60 : 50;
//       switch (i) {
//         case 0:
//           return PieChartSectionData(
//             color: const Color(0xff0293ee),
//             value: 40,
//             title: '40%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 1:
//           return PieChartSectionData(
//             color: const Color(0xfff8b250),
//             value: 30,
//             title: '30%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 2:
//           return PieChartSectionData(
//             color: const Color(0xff845bef),
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 3:
//           return PieChartSectionData(
//             color: const Color(0xff13d38e),
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         default:
//           return null;
//       }
//     });
//   }
// }
