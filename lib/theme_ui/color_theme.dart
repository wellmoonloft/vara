import 'package:flutter/material.dart';

class ColorTheme {
  ColorTheme._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0x00000000);
  static const Color background = Color(0xFFF2F3F8);
  static const Color transparent = Colors.transparent;

  static const Color boxbackground = Color(0xFFfcfcfc);
  static const Color grey = Color(0xFF808080);
  static const Color pantone = Color(0xFFE5E1E6);
  static const Color greydarker = Color(0xFF666666);
  static const Color greydoubledarker = Color(0xFF545454);
  static const Color greytripledarker = Color(0xFF2c2c2c);
  static const Color greyquadradarker = Color(0xFF191919);
  static const Color greylighter = Color(0xFFa0a0a0);
  static const Color greydoublelighter = Color(0xFFd8d8d8);

  static const Color pale = Color(0xFF5E61DE);
  static const Color palelighter = Color(0xFFa0a1eb);
  static const Color paledarker = Color(0xFF2b2fd2);

  static const Color neogreen = Color(0xFF64e4ab);
  static const Color neogreenlighter = Color(0xFFaaf0d1);
  static const Color greenlighter = Color(0xFF66DD98);
  static const Color neogreendarker = Color(0xFF008024);
  static const Color darkred = Color(0xFFcc0000);

  static const Color forWater = Color(0xFFE8EDFE);
  static const Color puristblue = Color(0xFF9CC9CF);
  static const Color puristbluelighter = Color(0xFFd9eaed);
  static const Color puristbluedarker = Color(0xFF6baeb7);

  static const Color cassis = Color(0xFFc79ba6);
  static const Color cassislighter = Color(0xFFe7d4d8);
  static const Color cassisdarker = Color(0xFF915261);
  static const Color redlighter = Color(0xFFEC5690);

  static const Color cantaloupe = Color(0xFFff6a4e);
  static const Color cantaloupelighter = Color(0xFFffb0a1);
  static const Color cantaloupedarker = Color(0xFFff320b);

  static const Color mellowyellow = Color(0xFFe6b254);
  static const Color mellowyellowlighter = Color(0xFFf0d198);
  static const Color mellowyellowdarker = Color(0xFFdb9920);

  static const Color bgColor = Color(0xFFE7EBF4);
  static const Color mainBlack = Color(0xFF161617);
  static const Color mainGreen = Color(0xFF36F740);
  static const Color mainRed = Color(0xFFFF4646);
  static const Color mainPink = Color(0xFFEC5690);
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
