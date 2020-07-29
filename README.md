# Vara
![](https://img.shields.io/badge/Toolkit-Flutter-blue.svg)  ![](https://img.shields.io/badge/Language-Dart-orange.svg)  ![](https://img.shields.io/apm/l/vim-mode)  ![](https://img.shields.io/badge/Process-Developing-blueviolet.svg)

Personal asset management
🇨🇳[简体中文](README-zh-cn.md) | 🇺🇸English

## Introduction

**Vara** [Estonian], means assets, A personal asset management app developed in flutter

Because of Covid-19, this year people attach great importance to "after-sleep income", so the demand for personal asset management and value-added has grown by leaps and bounds. Personally, I also have funds that "have not been valued very much in the past and very little". I hope to check funds, invest and bookkeeping by one mobile APP.

Since I have used most of the mainstream accounting apps in appstore. It is extremely uncomfortable for programmers to manual accounting. I mean this is 0202! People do not want to manual accounting. In addition, the biggest problem is those App need to log in! Log in will involve data upload. This is asset management App. Although my pockets are thin, it is also unbearable.

Therefore I need an APP like this:
1. Able to automatically record investment and living consumption (at least support EXCEL import)
2. No need to create users, fully localized (It can have http request, but can only use Get request to receive exchange rates and bills)
3. Supports multiple currencies, and can be summarized according to the exchange rate according to the designated currency
4. Support the investment list and daily consumption list, and have multiple reports and charts for viewing. Open the App every day with coffee and view your own rate of return, when you can achieve the most basic financial freedom (not working or starving)
5. It is best to be able to write import scripts by yourself. After all, there are so many investment channels and payment channels for daily consumption. It seems impossible to update the App every time.

![](https://gitee.com/wellmoonloft/images/raw/master/20200729235557.png)

------------------------------

## Quick start

1. Clone from git

2. Do `flutter create . ` in your project directory

3. Do `flutter packages get` in your project directory


## Dependents

- [charts_flutter: ^0.9.0](https://pub.dev/packages/charts_flutter) Material Design data visualization library written natively in Dart.
- [fl_chart: ^0.10.1](https://pub.dev/packages/fl_chart) A library to draw fantastic charts in Flutter
- [font_awesome_flutter: ^8.8.1](https://pub.dev/packages/font_awesome_flutter) The Font Awesome Icon pack available as set of Flutter Icons.
- [intl: ^0.16.0](https://pub.dev/packages/intl) This package provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
- [sqflite: ^1.3.1](https://pub.dev/packages/sqflite) SQLite plugin for Flutter.
- [path: ^1.6.4](https://pub.dev/packages/path) A comprehensive, cross-platform path manipulation library for Dart.
- [path_provider: ^1.6.11](https://pub.dev/packages/path_provider) A Flutter plugin for finding commonly used locations on the filesystem. 
- [file_picker: ^1.12.0](https://pub.dev/packages/file_picker) A package that allows you to use a native file explorer to pick single or multiple absolute file paths, with extensions filtering support.
- [excel: ^1.1.0](https://pub.dev/packages/excel) Excel is a flutter and dart library for creating and updating excel-sheets for XLSX files.
- [flutter_swiper: ^1.1.6](https://pub.dev/packages/flutter_swiper) The best swiper for flutter , with multiple layouts, infinite loop. Compatible with Android & iOS.
   
## Progress

It's not finished yet. I uploaded it to git just because there are two computers in my office and home, um.