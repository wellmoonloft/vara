import 'package:flutter/material.dart';

class ColorTheme {
  ColorTheme._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0x00000000);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2E3CC7);
  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color netAssets = Color(0xff27b6fc);
  static const Color assets = Color(0xff4af699);
  static const Color debt = Color(0xffaa4cfc);
  static const Color lightGreen = Color.fromARGB(255, 146, 226, 137);
  static const Color veryPaleYellow = Color.fromARGB(255, 250, 255, 195);
  static const Color flavescent = Color.fromARGB(255, 255, 243, 141);
  static const Color cottonCandy = Color.fromARGB(255, 249, 195, 219);
  static const Color miniPink = Color.fromARGB(255, 250, 215, 238);
  static const Color vodka = Color.fromARGB(255, 184, 202, 240);
  static const Color veryLightTangelo = Color.fromARGB(255, 255, 179, 123);
  static const Color paleCornflowerBlue = Color.fromARGB(255, 175, 197, 255);
  static const Color mistyRose = Color.fromARGB(255, 248, 227, 221);
  static const Color mediumChampagne = Color.fromARGB(255, 247, 235, 16);
  static const Color darkgreen = Color(0xFF039203);
  static const Color transparent = Colors.transparent;
  static const Color darkorange = Color(0xFFFB8E87);
  static const Color darkpink = Color(0xFFFF568A);
  static const Color darkpale = Color(0xFF5E61DE);
  static const Color appBackGrandColor_black = Color(0x00000000);
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
