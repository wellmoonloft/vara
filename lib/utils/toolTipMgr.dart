import 'dart:math';

import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/src/text_element.dart' as chartText;
import 'package:charts_flutter/src/text_style.dart' as style;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:vara/utils/toolkit.dart';

String _title;

String _subTitle;

class ToolTipMgr {
  static String get title => _title;

  static String get subTitle => _subTitle;

  static setTitle(Map<String, dynamic> data) {
    if (data['title'] != null && data['title'].length > 0) {
      _title = data['title'];
      _title = formatNum(num.parse(_title), 2);
    }

    if (data['subTitle'] != null && data['subTitle'].length > 0) {
      _subTitle = data['subTitle'];
    }
  }
}

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  double height = 400;

  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      FillPatternType fillPattern,
      Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
      Rectangle(
          bounds.left - 5, bounds.top, bounds.width * 10, bounds.height + 10),
      fill: Color.fromHex(code: "#5E61DE"),
    );

    var textStyle = style.TextStyle();

    textStyle.color = Color.white;
    textStyle.fontSize = 15;

    canvas.drawText(chartText.TextElement(ToolTipMgr.title, style: textStyle),
        (bounds.left).round(), (bounds.top + 2).round());
  }
}
