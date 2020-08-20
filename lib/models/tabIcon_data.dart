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

class CategroyIcon {
  IconData icon;
  String title;

  CategroyIcon({this.icon, this.title});

  static List<CategroyIcon> miscellaneousList = <CategroyIcon>[
    CategroyIcon(icon: FontAwesomeIcons.university, title: 'Bank cost'),
    CategroyIcon(icon: FontAwesomeIcons.tshirt, title: 'Clothes'),
    CategroyIcon(icon: FontAwesomeIcons.heart, title: 'Healthcare'),
    CategroyIcon(icon: FontAwesomeIcons.graduationCap, title: 'Student loan'),
  ];

  static List<CategroyIcon> entertainmentList = <CategroyIcon>[
    CategroyIcon(icon: FontAwesomeIcons.bowlingBall, title: 'Bowling'),
    CategroyIcon(icon: FontAwesomeIcons.film, title: 'Cinema'),
    CategroyIcon(icon: FontAwesomeIcons.bolt, title: 'Electronics'),
    CategroyIcon(icon: FontAwesomeIcons.umbrellaBeach, title: 'Vacation'),
    CategroyIcon(icon: FontAwesomeIcons.dumbbell, title: 'Gym'),
    CategroyIcon(icon: FontAwesomeIcons.pinterest, title: 'Hobby'),
    CategroyIcon(icon: FontAwesomeIcons.beer, title: 'Nightclub'),
    CategroyIcon(icon: FontAwesomeIcons.futbol, title: 'Sports'),
    CategroyIcon(icon: FontAwesomeIcons.youtubeSquare, title: 'Subscription'),
  ];

  static List<CategroyIcon> foodList = <CategroyIcon>[
    CategroyIcon(icon: FontAwesomeIcons.candyCane, title: 'Candy'),
    CategroyIcon(icon: FontAwesomeIcons.coffee, title: 'Coffee'),
    CategroyIcon(icon: FontAwesomeIcons.cocktail, title: 'Drinks'),
    CategroyIcon(icon: FontAwesomeIcons.utensils, title: 'Restaurant'),
    CategroyIcon(icon: FontAwesomeIcons.shoppingBag, title: 'Groceries'),
  ];

  static List<CategroyIcon> housingList = <CategroyIcon>[
    CategroyIcon(icon: FontAwesomeIcons.bolt, title: 'Electricity'),
    CategroyIcon(icon: FontAwesomeIcons.home, title: 'Housing'),
    CategroyIcon(icon: FontAwesomeIcons.heart, title: 'Insurance'),
    CategroyIcon(icon: FontAwesomeIcons.wifi, title: 'Internet'),
    CategroyIcon(icon: FontAwesomeIcons.moneyBill, title: 'Loan'),
    CategroyIcon(icon: FontAwesomeIcons.hammer, title: 'Maintenance'),
    CategroyIcon(icon: FontAwesomeIcons.university, title: 'Rent'),
    CategroyIcon(icon: FontAwesomeIcons.tv, title: 'TV'),
    CategroyIcon(icon: FontAwesomeIcons.mobileAlt, title: 'Telephone'),
    CategroyIcon(icon: FontAwesomeIcons.water, title: 'Water'),
  ];

  static List<CategroyIcon> lifestyleList = <CategroyIcon>[
    CategroyIcon(icon: FontAwesomeIcons.baby, title: 'Child care'),
    CategroyIcon(icon: FontAwesomeIcons.tooth, title: 'Dentist'),
    CategroyIcon(icon: FontAwesomeIcons.heart, title: 'Doctor'),
    CategroyIcon(icon: FontAwesomeIcons.gift, title: 'Gift'),
    CategroyIcon(icon: FontAwesomeIcons.hotel, title: 'Hotel'),
    CategroyIcon(icon: FontAwesomeIcons.star, title: 'Lifestyle'),
    CategroyIcon(icon: FontAwesomeIcons.paw, title: 'Pet'),
    CategroyIcon(icon: FontAwesomeIcons.capsules, title: 'Pharmacy'),
  ];

  static List<CategroyIcon> transportationList = <CategroyIcon>[
    CategroyIcon(icon: FontAwesomeIcons.carCrash, title: 'Car insurance'),
    CategroyIcon(icon: FontAwesomeIcons.car, title: 'Car Ioan'),
    CategroyIcon(icon: FontAwesomeIcons.plane, title: 'Flight'),
    CategroyIcon(icon: FontAwesomeIcons.gasPump, title: 'Gas'),
    CategroyIcon(icon: FontAwesomeIcons.parking, title: 'Parking'),
    CategroyIcon(icon: FontAwesomeIcons.subway, title: 'Public transport'),
    CategroyIcon(icon: FontAwesomeIcons.tools, title: 'Repair'),
    CategroyIcon(icon: FontAwesomeIcons.taxi, title: 'Taxi'),
    CategroyIcon(icon: FontAwesomeIcons.tram, title: 'Transportation'),
  ];

  static List<CategroyIcon> incomeList = <CategroyIcon>[
    CategroyIcon(icon: FontAwesomeIcons.child, title: 'Child benefit'),
    CategroyIcon(icon: FontAwesomeIcons.moneyBillAlt, title: 'Income'),
    CategroyIcon(icon: FontAwesomeIcons.university, title: 'Interest'),
    CategroyIcon(icon: FontAwesomeIcons.fileAlt, title: 'Investment'),
    CategroyIcon(icon: FontAwesomeIcons.userShield, title: 'Pension'),
    CategroyIcon(icon: FontAwesomeIcons.handHoldingUsd, title: 'Salary'),
  ];

  static List<CategroyIcon> savingsList = <CategroyIcon>[
    CategroyIcon(icon: FontAwesomeIcons.star, title: 'Emergency savings'),
    CategroyIcon(icon: FontAwesomeIcons.piggyBank, title: 'Savings'),
    CategroyIcon(
        icon: FontAwesomeIcons.umbrellaBeach, title: 'Vacation savings'),
  ];
}

class CategroyData {
  List<CategroyIcon> iconList;
  String categroyTitle;
  Color color;

  CategroyData({this.iconList, this.categroyTitle, this.color});

  static List<CategroyData> miscellaneousData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.miscellaneousList,
        categroyTitle: 'MisCellaneous',
        color: ColorTheme.greylighter)
  ];
  static List<CategroyData> entertainmentData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.entertainmentList,
        categroyTitle: 'Entertainment',
        color: ColorTheme.cassis)
  ];
  static List<CategroyData> foodData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.foodList,
        categroyTitle: 'Food & drinks',
        color: ColorTheme.neogreenlighter)
  ];
  static List<CategroyData> housingData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.housingList,
        categroyTitle: 'Housing',
        color: ColorTheme.mellowyellow)
  ];
  static List<CategroyData> lifestyleData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.lifestyleList,
        categroyTitle: 'Lifestyle',
        color: ColorTheme.cantaloupelighter)
  ];
  static List<CategroyData> transportationData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.transportationList,
        categroyTitle: 'Transportation',
        color: ColorTheme.pale)
  ];
  static List<CategroyData> incomeData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.incomeList,
        categroyTitle: 'Income',
        color: ColorTheme.neogreendarker)
  ];
  static List<CategroyData> savingsData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.savingsList,
        categroyTitle: 'Savings',
        color: ColorTheme.cassisdarker)
  ];
}
