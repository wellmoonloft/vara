import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabIconData {
  IconData imagePath;
  IconData selectedImagePath;
  bool isSelected;
  int index;
  TabIconData({
    this.imagePath,
    this.index = 0,
    this.selectedImagePath,
    this.isSelected = false,
    this.animationController,
  });

  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: FontAwesomeIcons.wallet,
      selectedImagePath: FontAwesomeIcons.wallet,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: FontAwesomeIcons.chartPie,
      selectedImagePath: FontAwesomeIcons.chartPie,
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: FontAwesomeIcons.donate,
      selectedImagePath: FontAwesomeIcons.donate,
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: FontAwesomeIcons.userFriends,
      selectedImagePath: FontAwesomeIcons.userFriends,
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}

class CurrencyData {
  IconData icon;
  String iconName;
  String short;
  num rate;

  CurrencyData({this.icon, this.iconName, this.short, this.rate});

  static List<CurrencyData> currencyList = <CurrencyData>[
    CurrencyData(
        icon: FontAwesomeIcons.yenSign, iconName: '¥', short: 'CNY', rate: 1),
    CurrencyData(
        icon: FontAwesomeIcons.yenSign, iconName: '¥', short: 'JPY', rate: 1),
    CurrencyData(
        icon: FontAwesomeIcons.dollarSign,
        iconName: '\$',
        short: 'USD',
        rate: 1),
    CurrencyData(
        icon: FontAwesomeIcons.euroSign, iconName: '€', short: 'EUR', rate: 1),
    CurrencyData(
        icon: FontAwesomeIcons.poundSign, iconName: '￡', short: 'GBP', rate: 1),
    CurrencyData(
        icon: FontAwesomeIcons.dollarSign,
        iconName: 'A\$',
        short: 'AUD',
        rate: 1),
    CurrencyData(
        icon: FontAwesomeIcons.dollarSign,
        iconName: 'C\$',
        short: 'CAD',
        rate: 1),
    CurrencyData(
        icon: FontAwesomeIcons.dollarSign,
        iconName: 'HK\$',
        short: 'HKD',
        rate: 1),
  ];
}

class CategroyIcon {
  IconData icon;
  String title;
  String value;

  CategroyIcon({this.icon, this.title, this.value});
}

class CategroyData {
  List<CategroyIcon> iconList;
  String categroyTitle;
  String categroyValue;
  Color color;

  CategroyData(
      {this.iconList, this.categroyTitle, this.color, this.categroyValue});
}

class MyStoreage {
  bool isCloud;
  String path;

  MyStoreage({this.isCloud, this.path});
  MyStoreage.fromJson(Map<String, dynamic> json) {
    isCloud = json['isCloud'];
    path = json['path'];
  }
  String toJson() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['isCloud'] = this.isCloud;
    map['path'] = this.path;
    return json.encode(map);
  }
}
