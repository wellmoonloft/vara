import 'package:flutter/material.dart';

import 'color_theme.dart';

class AppTheme {
  AppTheme._();
  static const double maxNumber = 1000000.00;
  static const outboxpadding =
      EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 30);
  static const inboxpadding = EdgeInsets.all(16);

  static const mainNumbers = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 30,
    color: ColorTheme.mainBlack,
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
  static const listTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: ColorTheme.mainBlack,
  );
  static const listTitleThin = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: ColorTheme.mainBlack,
  );
  static const noteSubTitleBlack = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: ColorTheme.mainBlack,
  );

  static const noteContent = TextStyle(
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

  static const subPageTitleWhite = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: ColorTheme.white,
  );

  static const listTitleWhite = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: ColorTheme.white,
  );

  static const noteSubTitleWhite = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: ColorTheme.white,
  );

  static const subPageTitlePale = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: ColorTheme.pale,
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
  static const boxDecorationBottle = BoxDecoration(
    color: ColorTheme.bgColor,
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
