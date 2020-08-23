// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Date`
  String get Date {
    return Intl.message(
      'Date',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get Amount {
    return Intl.message(
      'Amount',
      name: 'Amount',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get Status {
    return Intl.message(
      'Status',
      name: 'Status',
      desc: '',
      args: [],
    );
  }

  /// `Asset`
  String get Asset {
    return Intl.message(
      'Asset',
      name: 'Asset',
      desc: '',
      args: [],
    );
  }

  /// `Net Asset`
  String get NetAsset {
    return Intl.message(
      'Net Asset',
      name: 'NetAsset',
      desc: '',
      args: [],
    );
  }

  /// `Debt service`
  String get DebtService {
    return Intl.message(
      'Debt service',
      name: 'DebtService',
      desc: '',
      args: [],
    );
  }

  /// `Debt`
  String get Debt {
    return Intl.message(
      'Debt',
      name: 'Debt',
      desc: '',
      args: [],
    );
  }

  /// `Invest`
  String get Invest {
    return Intl.message(
      'Invest',
      name: 'Invest',
      desc: '',
      args: [],
    );
  }

  /// `Invest List`
  String get InvestList {
    return Intl.message(
      'Invest List',
      name: 'InvestList',
      desc: '',
      args: [],
    );
  }

  /// `Invest Detail`
  String get InvestDetail {
    return Intl.message(
      'Invest Detail',
      name: 'InvestDetail',
      desc: '',
      args: [],
    );
  }

  /// `Late Scatter Plot`
  String get LateScatterPlot {
    return Intl.message(
      'Late Scatter Plot',
      name: 'LateScatterPlot',
      desc: '',
      args: [],
    );
  }

  /// `Invested Profit`
  String get InvestedProfit {
    return Intl.message(
      'Invested Profit',
      name: 'InvestedProfit',
      desc: '',
      args: [],
    );
  }

  /// `Invested Funds`
  String get InvestedFunds {
    return Intl.message(
      'Invested Funds',
      name: 'InvestedFunds',
      desc: '',
      args: [],
    );
  }

  /// `Total Yield Year`
  String get TotalYieldYear {
    return Intl.message(
      'Total Yield Year',
      name: 'TotalYieldYear',
      desc: '',
      args: [],
    );
  }

  /// `Interest`
  String get Interest {
    return Intl.message(
      'Interest',
      name: 'Interest',
      desc: '',
      args: [],
    );
  }

  /// `Short`
  String get Short {
    return Intl.message(
      'Short',
      name: 'Short',
      desc: '',
      args: [],
    );
  }

  /// `less 90days`
  String get ShortSub {
    return Intl.message(
      'less 90days',
      name: 'ShortSub',
      desc: '',
      args: [],
    );
  }

  /// `Mid`
  String get Mid {
    return Intl.message(
      'Mid',
      name: 'Mid',
      desc: '',
      args: [],
    );
  }

  /// `less 365 days`
  String get MidSub {
    return Intl.message(
      'less 365 days',
      name: 'MidSub',
      desc: '',
      args: [],
    );
  }

  /// `Long`
  String get Long {
    return Intl.message(
      'Long',
      name: 'Long',
      desc: '',
      args: [],
    );
  }

  /// `over 365 days`
  String get LongSub {
    return Intl.message(
      'over 365 days',
      name: 'LongSub',
      desc: '',
      args: [],
    );
  }

  /// `Invest Code`
  String get InvestCode {
    return Intl.message(
      'Invest Code',
      name: 'InvestCode',
      desc: '',
      args: [],
    );
  }

  /// `Invest Date`
  String get InvestDate {
    return Intl.message(
      'Invest Date',
      name: 'InvestDate',
      desc: '',
      args: [],
    );
  }

  /// `Plan Payment Date`
  String get PlanPaymentDate {
    return Intl.message(
      'Plan Payment Date',
      name: 'PlanPaymentDate',
      desc: '',
      args: [],
    );
  }

  /// `Final Payment Date`
  String get FinalPaymentDate {
    return Intl.message(
      'Final Payment Date',
      name: 'FinalPaymentDate',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get Received {
    return Intl.message(
      'Received',
      name: 'Received',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get Currency {
    return Intl.message(
      'Currency',
      name: 'Currency',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get Country {
    return Intl.message(
      'Country',
      name: 'Country',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get Transaction {
    return Intl.message(
      'Transaction',
      name: 'Transaction',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Summary`
  String get TransactionSummary {
    return Intl.message(
      'Transaction Summary',
      name: 'TransactionSummary',
      desc: '',
      args: [],
    );
  }

  /// `Transaction List`
  String get TransactionList {
    return Intl.message(
      'Transaction List',
      name: 'TransactionList',
      desc: '',
      args: [],
    );
  }

  /// `Net Income`
  String get NetIncome {
    return Intl.message(
      'Net Income',
      name: 'NetIncome',
      desc: '',
      args: [],
    );
  }

  /// `Financial Freedom`
  String get FinancialFreedom {
    return Intl.message(
      'Financial Freedom',
      name: 'FinancialFreedom',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get Income {
    return Intl.message(
      'Income',
      name: 'Income',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get Expenses {
    return Intl.message(
      'Expenses',
      name: 'Expenses',
      desc: '',
      args: [],
    );
  }

  /// `New Transaction`
  String get NewTransaction {
    return Intl.message(
      'New Transaction',
      name: 'NewTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get AccountInformation {
    return Intl.message(
      'Account Information',
      name: 'AccountInformation',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get UserName {
    return Intl.message(
      'User Name',
      name: 'UserName',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get Alert {
    return Intl.message(
      'Alert',
      name: 'Alert',
      desc: '',
      args: [],
    );
  }

  /// `Please choose category and input amount and note.`
  String get AlertNote {
    return Intl.message(
      'Please choose category and input amount and note.',
      name: 'AlertNote',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get Import {
    return Intl.message(
      'Import',
      name: 'Import',
      desc: '',
      args: [],
    );
  }

  /// `Press the Icon above to import.`
  String get ImportNote {
    return Intl.message(
      'Press the Icon above to import.',
      name: 'ImportNote',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'et', countryCode: 'EE'),
      Locale.fromSubtags(languageCode: 'ja', countryCode: 'JP'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'HK'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}