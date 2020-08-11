import 'package:flutter/material.dart';
import 'color_theme.dart';

class AppTheme {
  AppTheme._();
  //-----Padding-----
  static const double leftRightPadding = 16;
  static const outboxpadding =
      EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10);
  static const inboxpadding =
      EdgeInsets.only(left: 24, right: 24, top: 5, bottom: 5);

  //------TextStyle-----

  static const toptitleText = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
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
    letterSpacing: 1.2,
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
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: ColorTheme.cassislighter,
  );

  //------BorderRadiusStyle-----

  static const normalBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(8.0),
      bottomLeft: Radius.circular(8.0),
      bottomRight: Radius.circular(8.0),
      topRight: Radius.circular(8.0));

  static const smallBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(6.0),
      bottomLeft: Radius.circular(6.0),
      bottomRight: Radius.circular(6.0),
      topRight: Radius.circular(6.0));
}

final normalBoxShadow = BoxShadow(
    color: ColorTheme.grey.withOpacity(0.2),
    offset: Offset(1.1, 1.1),
    blurRadius: 10.0);

final boxDecoration = BoxDecoration(
  color: ColorTheme.white,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.0),
      bottomLeft: Radius.circular(8.0),
      bottomRight: Radius.circular(8.0),
      topRight: Radius.circular(8.0)),
  boxShadow: <BoxShadow>[
    BoxShadow(
        color: ColorTheme.grey.withOpacity(0.2),
        offset: Offset(1.1, 1.1),
        blurRadius: 10.0),
  ],
);
