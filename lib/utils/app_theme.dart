import 'package:flutter/material.dart';

import 'color_theme.dart';

class AppTheme {
  AppTheme._();
  static const double leftRightPadding = 16;
}

//MainPadding

final boxpadding = EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 12);

//TextStyle

final titleText = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 20,
  color: ColorTheme.greytripledarker,
);

final titleTextSmall = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: ColorTheme.greytripledarker,
);

final subtitleText = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 16,
  color: ColorTheme.cassislighter,
);
