import 'package:flutter/material.dart';

import 'color_theme.dart';

class AppTheme {
  AppTheme._();
  static const double leftRightPadding = 16;
  static const outboxpadding =
      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10);
  static const inboxpadding =
      EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 5);
  static const chartTitlepadding =
      EdgeInsets.only(left: 24, right: 8, top: 8, bottom: 8);

  static const normalBorderRadius = BorderRadius.all(Radius.circular(8.0));
  static const smallBorderRadius = BorderRadius.all(Radius.circular(6.0));
  static const normalBoxShadow = BoxShadow(
      color: ColorTheme.grey, offset: Offset(1.1, 1.1), blurRadius: 5.0);
  static const boxDecoration = BoxDecoration(
    color: ColorTheme.white,
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: ColorTheme.grey, offset: Offset(1.1, 1.1), blurRadius: 8.0),
      BoxShadow(
          color: ColorTheme.white, offset: Offset(-1.1, -1.1), blurRadius: 8.0),
    ],
  );
}

setHomeNumnberText(Color color) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 40,
    color: color,
  );
}

setTitleText(Color color) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 28,
    color: color,
  );
}

setHomeGraphNumnber(Color color) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: color,
  );
}

setHomeGraphNumnberLighter(Color color) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: color,
  );
}

setNoteTitle(Color color) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: -0.5,
    color: color,
  );
}

setNoteTitleSmall(Color color) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: color,
  );
}

setNoteTitleLighter(Color color) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: color,
  );
}

setHomeGraphTitle(Color color) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: -0.5,
    color: color,
  );
}
