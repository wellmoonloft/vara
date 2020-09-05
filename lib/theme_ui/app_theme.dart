import 'package:flutter/material.dart';

import 'color_theme.dart';

class AppTheme {
  AppTheme._();
  static const double maxNumber = 100000.00;
  static const double leftRightPadding = 16;
  static const outboxpadding =
      EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 30);
  static const inboxpadding = EdgeInsets.all(16);
  static const inboxwithout =
      EdgeInsets.only(left: 10, right: 16, top: 16, bottom: 16);
  static const chartTitlepadding =
      EdgeInsets.only(left: 24, right: 8, top: 8, bottom: 8);

  static const mainNumbers = TextStyle(
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
    fontSize: 30,
    color: ColorTheme.mainBlack,
  );

  static const subNumbers = TextStyle(
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
    fontSize: 20,
    color: ColorTheme.mainBlack,
  );

  static const inboxNumber = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: -0.5,
    color: ColorTheme.white,
  );

  static const noteUnderNumbers = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: ColorTheme.greylighter,
  );

  static const noteTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: ColorTheme.greylighter,
  );

  static const noteSubTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: ColorTheme.greylighter,
  );
  static const noteSubTitleWhite = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: ColorTheme.white,
  );

  static const listTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: ColorTheme.mainBlack,
  );

  static const listTitleWhite = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: ColorTheme.white,
  );

  static const pageTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 28,
    color: ColorTheme.mainBlack,
  );

  static const subPageTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: ColorTheme.mainBlack,
  );

  static const normalBorderRadius = BorderRadius.all(Radius.circular(8.0));
  static const smallBorderRadius = BorderRadius.all(Radius.circular(6.0));
  static const normalBoxShadow = BoxShadow(
      color: ColorTheme.grey, offset: Offset(1.1, 1.1), blurRadius: 5.0);
  static const boxDecoration = BoxDecoration(
    color: ColorTheme.white,
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: ColorTheme.greydoublelighter,
          offset: Offset(1.1, 1.1),
          blurRadius: 8.0),
    ],
  );
  static const boxDecorationBlack = BoxDecoration(
    color: ColorTheme.mainBlack,
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: ColorTheme.greydoublelighter,
          offset: Offset(1.1, 1.1),
          blurRadius: 8.0),
    ],
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
