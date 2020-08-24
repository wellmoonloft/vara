import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vara/generated/l10n.dart';
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
        value: S.current.BankCost),
    CategroyIcon(
        icon: FontAwesomeIcons.tshirt,
        title: 'Clothes',
        value: S.current.Clothes),
    CategroyIcon(
        icon: FontAwesomeIcons.heart,
        title: 'Healthcare',
        value: S.current.Healthcare),
    CategroyIcon(
        icon: FontAwesomeIcons.graduationCap,
        title: 'Student loan',
        value: S.current.StudentLoan),
  ];

  static List<CategroyIcon> entertainmentList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.bowlingBall,
        title: 'Bowling',
        value: S.current.Bowling),
    CategroyIcon(
        icon: FontAwesomeIcons.film, title: 'Cinema', value: S.current.Cinema),
    CategroyIcon(
        icon: FontAwesomeIcons.bolt,
        title: 'Electronics',
        value: S.current.Electronics),
    CategroyIcon(
        icon: FontAwesomeIcons.umbrellaBeach,
        title: 'Vacation',
        value: S.current.Vacation),
    CategroyIcon(
        icon: FontAwesomeIcons.dumbbell, title: 'Gym', value: S.current.Gym),
    CategroyIcon(
        icon: FontAwesomeIcons.pinterest,
        title: 'Hobby',
        value: S.current.Hobby),
    CategroyIcon(
        icon: FontAwesomeIcons.beer,
        title: 'Nightclub',
        value: S.current.Nightclub),
    CategroyIcon(
        icon: FontAwesomeIcons.futbol,
        title: 'Sports',
        value: S.current.Sports),
    CategroyIcon(
        icon: FontAwesomeIcons.youtubeSquare,
        title: 'Subscription',
        value: S.current.Subscription),
  ];

  static List<CategroyIcon> foodList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.candyCane,
        title: 'Candy',
        value: S.current.Candy),
    CategroyIcon(
        icon: FontAwesomeIcons.coffee,
        title: 'Coffee',
        value: S.current.Coffee),
    CategroyIcon(
        icon: FontAwesomeIcons.cocktail,
        title: 'Drinks',
        value: S.current.Drinks),
    CategroyIcon(
        icon: FontAwesomeIcons.utensils,
        title: 'Restaurant',
        value: S.current.Restaurant),
    CategroyIcon(
        icon: FontAwesomeIcons.shoppingBag,
        title: 'Groceries',
        value: S.current.Groceries),
  ];

  static List<CategroyIcon> housingList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.bolt,
        title: 'Electricity',
        value: S.current.Electricity),
    CategroyIcon(
        icon: FontAwesomeIcons.home,
        title: 'Housing',
        value: S.current.Housing),
    CategroyIcon(
        icon: FontAwesomeIcons.heart,
        title: 'Insurance',
        value: S.current.Insurance),
    CategroyIcon(
        icon: FontAwesomeIcons.wifi,
        title: 'Internet',
        value: S.current.Internet),
    CategroyIcon(
        icon: FontAwesomeIcons.moneyBill, title: 'Loan', value: S.current.Loan),
    CategroyIcon(
        icon: FontAwesomeIcons.hammer,
        title: 'Maintenance',
        value: S.current.Maintenance),
    CategroyIcon(
        icon: FontAwesomeIcons.university,
        title: 'Rent',
        value: S.current.Rent),
    CategroyIcon(icon: FontAwesomeIcons.tv, title: 'TV', value: S.current.TV),
    CategroyIcon(
        icon: FontAwesomeIcons.mobileAlt,
        title: 'Telephone',
        value: S.current.Telephone),
    CategroyIcon(
        icon: FontAwesomeIcons.water, title: 'Water', value: S.current.Water),
  ];

  static List<CategroyIcon> lifestyleList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.baby,
        title: 'Child care',
        value: S.current.ChildCare),
    CategroyIcon(
        icon: FontAwesomeIcons.tooth,
        title: 'Dentist',
        value: S.current.Dentist),
    CategroyIcon(
        icon: FontAwesomeIcons.heart, title: 'Doctor', value: S.current.Doctor),
    CategroyIcon(
        icon: FontAwesomeIcons.gift, title: 'Gift', value: S.current.Gift),
    CategroyIcon(
        icon: FontAwesomeIcons.hotel, title: 'Hotel', value: S.current.Hotel),
    CategroyIcon(
        icon: FontAwesomeIcons.star,
        title: 'Lifestyle',
        value: S.current.Lifestyle),
    CategroyIcon(
        icon: FontAwesomeIcons.paw, title: 'Pet', value: S.current.Pet),
    CategroyIcon(
        icon: FontAwesomeIcons.capsules,
        title: 'Pharmacy',
        value: S.current.Pharmacy),
  ];

  static List<CategroyIcon> transportationList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.carCrash,
        title: 'Car insurance',
        value: S.current.CarInsurance),
    CategroyIcon(
        icon: FontAwesomeIcons.car,
        title: 'Car Ioan',
        value: S.current.CarIoan),
    CategroyIcon(
        icon: FontAwesomeIcons.plane, title: 'Flight', value: S.current.Flight),
    CategroyIcon(
        icon: FontAwesomeIcons.gasPump, title: 'Gas', value: S.current.Gas),
    CategroyIcon(
        icon: FontAwesomeIcons.parking,
        title: 'Parking',
        value: S.current.Parking),
    CategroyIcon(
        icon: FontAwesomeIcons.subway,
        title: 'Public transport',
        value: S.current.PublicTransport),
    CategroyIcon(
        icon: FontAwesomeIcons.tools, title: 'Repair', value: S.current.Repair),
    CategroyIcon(
        icon: FontAwesomeIcons.taxi, title: 'Taxi', value: S.current.Taxi),
    CategroyIcon(
        icon: FontAwesomeIcons.tram,
        title: 'Transportation',
        value: S.current.Transportation),
  ];

  static List<CategroyIcon> incomeList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.child,
        title: 'Child benefit',
        value: S.current.ChildBenefit),
    CategroyIcon(
        icon: FontAwesomeIcons.moneyBillAlt,
        title: 'Income',
        value: S.current.Income),
    CategroyIcon(
        icon: FontAwesomeIcons.university,
        title: 'Interest',
        value: S.current.Interest),
    CategroyIcon(
        icon: FontAwesomeIcons.fileAlt,
        title: 'Investment',
        value: S.current.Investment),
    CategroyIcon(
        icon: FontAwesomeIcons.userShield,
        title: 'Pension',
        value: S.current.Pension),
    CategroyIcon(
        icon: FontAwesomeIcons.handHoldingUsd,
        title: 'Salary',
        value: S.current.Salary),
  ];

  static List<CategroyIcon> savingsList = <CategroyIcon>[
    CategroyIcon(
        icon: FontAwesomeIcons.star,
        title: 'Emergency savings',
        value: S.current.EmergencySavings),
    CategroyIcon(
        icon: FontAwesomeIcons.piggyBank,
        title: 'Savings',
        value: S.current.Savings),
    CategroyIcon(
        icon: FontAwesomeIcons.umbrellaBeach,
        title: 'Vacation savings',
        value: S.current.VacationSavings),
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
        categroyValue: S.current.MisCellaneous,
        color: ColorTheme.greylighter)
  ];
  static List<CategroyData> entertainmentData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.entertainmentList,
        categroyTitle: 'Entertainment',
        categroyValue: S.current.Entertainment,
        color: ColorTheme.cassis)
  ];
  static List<CategroyData> foodData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.foodList,
        categroyTitle: 'FoodDrinks',
        categroyValue: S.current.FoodDrinks,
        color: ColorTheme.neogreenlighter)
  ];
  static List<CategroyData> housingData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.housingList,
        categroyTitle: 'Housing',
        categroyValue: S.current.Housing,
        color: ColorTheme.mellowyellow)
  ];
  static List<CategroyData> lifestyleData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.lifestyleList,
        categroyTitle: 'Lifestyle',
        categroyValue: S.current.Lifestyle,
        color: ColorTheme.cantaloupelighter)
  ];
  static List<CategroyData> transportationData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.transportationList,
        categroyTitle: 'Transportation',
        categroyValue: S.current.Transportation,
        color: ColorTheme.pale)
  ];
  static List<CategroyData> incomeData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.incomeList,
        categroyTitle: 'Income',
        categroyValue: S.current.Income,
        color: ColorTheme.neogreendarker)
  ];
  static List<CategroyData> savingsData = <CategroyData>[
    CategroyData(
        iconList: CategroyIcon.savingsList,
        categroyTitle: 'Savings',
        categroyValue: S.current.Savings,
        color: ColorTheme.cassisdarker)
  ];
}

getCategroyValue(String title) {
  return S.current.Savings;
}
