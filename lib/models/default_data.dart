import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vara/theme_ui/color_theme.dart';

class TabIconData {
  TabIconData({
    this.imagePath,
    this.index = 0,
    this.selectedImagePath,
    this.isSelected = false,
    this.animationController,
  });

  IconData imagePath;
  IconData selectedImagePath;
  bool isSelected;
  int index;

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
        iconName: 'NZ\$',
        short: 'NZD',
        rate: 1),
    CurrencyData(
        icon: FontAwesomeIcons.dollarSign,
        iconName: 'HK\$',
        short: 'HKD',
        rate: 1),
    CurrencyData(
        icon: FontAwesomeIcons.dollarSign,
        iconName: 'S\$',
        short: 'SGD',
        rate: 1),
  ];
}

class CategroyIcon {
  IconData icon;
  String title;
  String value;

  CategroyIcon({this.icon, this.title, this.value});

  static List<CategroyIcon> miscellaneousList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.university,
        title: 'Bank cost',
        value: 'Bank cost'),
    CategroyIcon(
        icon: FontAwesomeIcons.tshirt, title: 'Clothes', value: 'Clothes'),
    CategroyIcon(
        icon: FontAwesomeIcons.heart, title: 'Healthcare', value: 'Healthcare'),
    CategroyIcon(
        icon: FontAwesomeIcons.graduationCap,
        title: 'Student loan',
        value: 'Student loan'),
  ];

  static List<CategroyIcon> entertainmentList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.bowlingBall, title: 'Bowling', value: 'Bowling'),
    CategroyIcon(icon: FontAwesomeIcons.film, title: 'Cinema', value: 'Cinema'),
    CategroyIcon(
        icon: FontAwesomeIcons.bolt,
        title: 'Electronics',
        value: 'Electronics'),
    CategroyIcon(
        icon: FontAwesomeIcons.umbrellaBeach,
        title: 'Vacation',
        value: 'Vacation'),
    CategroyIcon(icon: FontAwesomeIcons.dumbbell, title: 'Gym', value: 'Gym'),
    CategroyIcon(
        icon: FontAwesomeIcons.pinterest, title: 'Hobby', value: 'Hobby'),
    CategroyIcon(
        icon: FontAwesomeIcons.beer, title: 'Nightclub', value: 'Nightclub'),
    CategroyIcon(
        icon: FontAwesomeIcons.futbol, title: 'Sports', value: 'Sports'),
    CategroyIcon(
        icon: FontAwesomeIcons.youtubeSquare,
        title: 'Subscription',
        value: 'Subscription'),
  ];

  static List<CategroyIcon> foodList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.candyCane, title: 'Candy', value: 'Candy'),
    CategroyIcon(
        icon: FontAwesomeIcons.coffee, title: 'Coffee', value: 'Coffee'),
    CategroyIcon(
        icon: FontAwesomeIcons.cocktail, title: 'Drinks', value: 'Drinks'),
    CategroyIcon(
        icon: FontAwesomeIcons.utensils,
        title: 'Restaurant',
        value: 'Restaurant'),
    CategroyIcon(
        icon: FontAwesomeIcons.shoppingBag,
        title: 'Groceries',
        value: 'Groceries'),
  ];

  static List<CategroyIcon> housingList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.bolt,
        title: 'Electricity',
        value: 'Electricity'),
    CategroyIcon(
        icon: FontAwesomeIcons.home, title: 'Housing', value: 'Housing'),
    CategroyIcon(
        icon: FontAwesomeIcons.heart, title: 'Insurance', value: 'Insurance'),
    CategroyIcon(
        icon: FontAwesomeIcons.wifi, title: 'Internet', value: 'Internet'),
    CategroyIcon(
        icon: FontAwesomeIcons.moneyBill, title: 'Loan', value: 'Loan'),
    CategroyIcon(
        icon: FontAwesomeIcons.hammer,
        title: 'Maintenance',
        value: 'Maintenance'),
    CategroyIcon(
        icon: FontAwesomeIcons.university, title: 'Rent', value: 'Rent'),
    CategroyIcon(icon: FontAwesomeIcons.tv, title: 'TV', value: 'TV'),
    CategroyIcon(
        icon: FontAwesomeIcons.mobileAlt,
        title: 'Telephone',
        value: 'Telephone'),
    CategroyIcon(icon: FontAwesomeIcons.water, title: 'Water', value: 'Water'),
  ];

  static List<CategroyIcon> lifestyleList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.baby, title: 'Child care', value: 'Child care'),
    CategroyIcon(
        icon: FontAwesomeIcons.tooth, title: 'Dentist', value: 'Dentist'),
    CategroyIcon(
        icon: FontAwesomeIcons.heart, title: 'Doctor', value: 'Doctor'),
    CategroyIcon(icon: FontAwesomeIcons.gift, title: 'Gift', value: 'Gift'),
    CategroyIcon(icon: FontAwesomeIcons.hotel, title: 'Hotel', value: 'Hotel'),
    CategroyIcon(
        icon: FontAwesomeIcons.star, title: 'Lifestyle', value: 'Lifestyle'),
    CategroyIcon(icon: FontAwesomeIcons.paw, title: 'Pet', value: 'Pet'),
    CategroyIcon(
        icon: FontAwesomeIcons.capsules, title: 'Pharmacy', value: 'Pharmacy'),
  ];

  static List<CategroyIcon> transportationList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.carCrash,
        title: 'Car insurance',
        value: 'Car insurance'),
    CategroyIcon(
        icon: FontAwesomeIcons.car, title: 'Car Ioan', value: 'Car Ioan'),
    CategroyIcon(
        icon: FontAwesomeIcons.plane, title: 'Flight', value: 'Flight'),
    CategroyIcon(icon: FontAwesomeIcons.gasPump, title: 'Gas', value: 'Gas'),
    CategroyIcon(
        icon: FontAwesomeIcons.parking, title: 'Parking', value: 'Parking'),
    CategroyIcon(
        icon: FontAwesomeIcons.subway,
        title: 'Public transport',
        value: 'Public transport'),
    CategroyIcon(
        icon: FontAwesomeIcons.tools, title: 'Repair', value: 'Repair'),
    CategroyIcon(icon: FontAwesomeIcons.taxi, title: 'Taxi', value: 'Taxi'),
    CategroyIcon(
        icon: FontAwesomeIcons.tram,
        title: 'Transportation',
        value: 'Transportation'),
  ];

  static List<CategroyIcon> incomeList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.child,
        title: 'Child benefit',
        value: 'Child benefit'),
    CategroyIcon(
        icon: FontAwesomeIcons.moneyBillAlt, title: 'Income', value: 'Income'),
    CategroyIcon(
        icon: FontAwesomeIcons.university,
        title: 'Interest',
        value: 'Interest'),
    CategroyIcon(
        icon: FontAwesomeIcons.fileAlt,
        title: 'Investment',
        value: 'Investment'),
    CategroyIcon(
        icon: FontAwesomeIcons.userShield, title: 'Pension', value: 'Pension'),
    CategroyIcon(
        icon: FontAwesomeIcons.handHoldingUsd,
        title: 'Salary',
        value: 'Salary'),
  ];

  static List<CategroyIcon> savingsList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.star,
        title: 'Emergency savings',
        value: 'Emergency savings'),
    CategroyIcon(
        icon: FontAwesomeIcons.piggyBank, title: 'Savings', value: 'Savings'),
    CategroyIcon(
        icon: FontAwesomeIcons.umbrellaBeach,
        title: 'Vacation savings',
        value: 'Vacation savings'),
  ];
}

class CategroyData {
  List<CategroyIcon> iconList;
  String categroyTitle;
  String categroyValue;
  Color color;

  CategroyData(
      {this.iconList, this.categroyTitle, this.color, this.categroyValue});

  static List<CategroyData> miscellaneousData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.miscellaneousList,
        categroyTitle: 'MisCellaneous',
        categroyValue: 'MisCellaneous',
        color: ColorTheme.greylighter)
  ];
  static List<CategroyData> entertainmentData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.entertainmentList,
        categroyTitle: 'Entertainment',
        categroyValue: 'Entertainment',
        color: ColorTheme.cassis)
  ];
  static List<CategroyData> foodData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.foodList,
        categroyTitle: 'Food & drinks',
        categroyValue: 'Food & drinks',
        color: ColorTheme.neogreenlighter)
  ];
  static List<CategroyData> housingData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.housingList,
        categroyTitle: 'Housing',
        categroyValue: 'Housing',
        color: ColorTheme.mellowyellow)
  ];
  static List<CategroyData> lifestyleData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.lifestyleList,
        categroyTitle: 'Lifestyle',
        categroyValue: 'Lifestyle',
        color: ColorTheme.cantaloupelighter)
  ];
  static List<CategroyData> transportationData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.transportationList,
        categroyTitle: 'Transportation',
        categroyValue: 'Transportation',
        color: ColorTheme.pale)
  ];
  static List<CategroyData> incomeData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.incomeList,
        categroyTitle: 'Income',
        categroyValue: 'Income',
        color: ColorTheme.neogreendarker)
  ];
  static List<CategroyData> savingsData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.savingsList,
        categroyTitle: 'Savings',
        categroyValue: 'Savings',
        color: ColorTheme.cassisdarker)
  ];
}
