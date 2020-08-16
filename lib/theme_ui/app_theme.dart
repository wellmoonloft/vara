import 'package:flutter/material.dart';
import 'color_theme.dart';

class AppTheme {
  AppTheme._();
  //-----Padding-----
  static const double leftRightPadding = 16;
  static const outboxpadding =
      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10);
  static const inboxpadding =
      EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 5);
  static const chartTitlepadding =
      EdgeInsets.only(left: 24, right: 8, top: 8, bottom: 8);
  //------TextStyle-----

  static const toptitleText = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    letterSpacing: 0,
    color: ColorTheme.white,
  );

  static const chartText = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    letterSpacing: 0,
    color: ColorTheme.white,
  );

  static const toptitleBigText = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    letterSpacing: 0,
    color: ColorTheme.white,
  );

  static const buttomTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    letterSpacing: 1,
    color: ColorTheme.white,
  );

  static const titleText = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: ColorTheme.greytripledarker,
  );

  static const titleTextSmall = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: ColorTheme.greytripledarker,
  );

  static const titleTextSmallLighter = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: ColorTheme.greydarker,
  );

  static const subtitleText = TextStyle(
    fontSize: 12,
    letterSpacing: 0.0,
    color: ColorTheme.grey,
  );

  //------BorderRadiusStyle-----

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
