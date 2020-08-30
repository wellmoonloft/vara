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

  /// `Scatter Chart of Overdue`
  String get LateScatterPlot {
    return Intl.message(
      'Scatter Chart of Overdue',
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

  /// `Savings`
  String get Savings {
    return Intl.message(
      'Savings',
      name: 'Savings',
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

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Use`
  String get Use {
    return Intl.message(
      'Use',
      name: 'Use',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get FirstName {
    return Intl.message(
      'First Name',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Mid Name`
  String get MidName {
    return Intl.message(
      'Mid Name',
      name: 'MidName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get LastName {
    return Intl.message(
      'Last Name',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get Age {
    return Intl.message(
      'Age',
      name: 'Age',
      desc: '',
      args: [],
    );
  }

  /// `Sex`
  String get Sex {
    return Intl.message(
      'Sex',
      name: 'Sex',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Male {
    return Intl.message(
      'Male',
      name: 'Male',
      desc: '',
      args: [],
    );
  }

  /// `Famale`
  String get Famale {
    return Intl.message(
      'Famale',
      name: 'Famale',
      desc: '',
      args: [],
    );
  }

  /// `Storage`
  String get Storage {
    return Intl.message(
      'Storage',
      name: 'Storage',
      desc: '',
      args: [],
    );
  }

  /// `Path`
  String get Path {
    return Intl.message(
      'Path',
      name: 'Path',
      desc: '',
      args: [],
    );
  }

  /// `Save on Cloud`
  String get SaveOnCloud {
    return Intl.message(
      'Save on Cloud',
      name: 'SaveOnCloud',
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

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message(
      'Delete',
      name: 'Delete',
      desc: '',
      args: [],
    );
  }

  /// `Confirm delete this bill: {amount} {use}?`
  String ConfirmNote(Object amount, Object use) {
    return Intl.message(
      'Confirm delete this bill: $amount $use?',
      name: 'ConfirmNote',
      desc: '',
      args: [amount, use],
    );
  }

  /// `This bill: {bill} was deleted.`
  String DeleteNote(Object bill) {
    return Intl.message(
      'This bill: $bill was deleted.',
      name: 'DeleteNote',
      desc: '',
      args: [bill],
    );
  }

  /// `MisCellaneous`
  String get MisCellaneous {
    return Intl.message(
      'MisCellaneous',
      name: 'MisCellaneous',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get Entertainment {
    return Intl.message(
      'Entertainment',
      name: 'Entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Food & Drinks`
  String get FoodDrinks {
    return Intl.message(
      'Food & Drinks',
      name: 'FoodDrinks',
      desc: '',
      args: [],
    );
  }

  /// `Housing`
  String get Housing {
    return Intl.message(
      'Housing',
      name: 'Housing',
      desc: '',
      args: [],
    );
  }

  /// `Lifestyle`
  String get Lifestyle {
    return Intl.message(
      'Lifestyle',
      name: 'Lifestyle',
      desc: '',
      args: [],
    );
  }

  /// `Transportation`
  String get Transportation {
    return Intl.message(
      'Transportation',
      name: 'Transportation',
      desc: '',
      args: [],
    );
  }

  /// `Vacation Savings`
  String get VacationSavings {
    return Intl.message(
      'Vacation Savings',
      name: 'VacationSavings',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Savings`
  String get EmergencySavings {
    return Intl.message(
      'Emergency Savings',
      name: 'EmergencySavings',
      desc: '',
      args: [],
    );
  }

  /// `Salary`
  String get Salary {
    return Intl.message(
      'Salary',
      name: 'Salary',
      desc: '',
      args: [],
    );
  }

  /// `Pension`
  String get Pension {
    return Intl.message(
      'Pension',
      name: 'Pension',
      desc: '',
      args: [],
    );
  }

  /// `Investment`
  String get Investment {
    return Intl.message(
      'Investment',
      name: 'Investment',
      desc: '',
      args: [],
    );
  }

  /// `Child Benefit`
  String get ChildBenefit {
    return Intl.message(
      'Child Benefit',
      name: 'ChildBenefit',
      desc: '',
      args: [],
    );
  }

  /// `Taxi`
  String get Taxi {
    return Intl.message(
      'Taxi',
      name: 'Taxi',
      desc: '',
      args: [],
    );
  }

  /// `Repair`
  String get Repair {
    return Intl.message(
      'Repair',
      name: 'Repair',
      desc: '',
      args: [],
    );
  }

  /// `Public Transport`
  String get PublicTransport {
    return Intl.message(
      'Public Transport',
      name: 'PublicTransport',
      desc: '',
      args: [],
    );
  }

  /// `Parking`
  String get Parking {
    return Intl.message(
      'Parking',
      name: 'Parking',
      desc: '',
      args: [],
    );
  }

  /// `Gas`
  String get Gas {
    return Intl.message(
      'Gas',
      name: 'Gas',
      desc: '',
      args: [],
    );
  }

  /// `Flight`
  String get Flight {
    return Intl.message(
      'Flight',
      name: 'Flight',
      desc: '',
      args: [],
    );
  }

  /// `Car Ioan`
  String get CarIoan {
    return Intl.message(
      'Car Ioan',
      name: 'CarIoan',
      desc: '',
      args: [],
    );
  }

  /// `Car Insurance`
  String get CarInsurance {
    return Intl.message(
      'Car Insurance',
      name: 'CarInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy`
  String get Pharmacy {
    return Intl.message(
      'Pharmacy',
      name: 'Pharmacy',
      desc: '',
      args: [],
    );
  }

  /// `Pet`
  String get Pet {
    return Intl.message(
      'Pet',
      name: 'Pet',
      desc: '',
      args: [],
    );
  }

  /// `Gift`
  String get Gift {
    return Intl.message(
      'Gift',
      name: 'Gift',
      desc: '',
      args: [],
    );
  }

  /// `Hotel`
  String get Hotel {
    return Intl.message(
      'Hotel',
      name: 'Hotel',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get Doctor {
    return Intl.message(
      'Doctor',
      name: 'Doctor',
      desc: '',
      args: [],
    );
  }

  /// `Dentist`
  String get Dentist {
    return Intl.message(
      'Dentist',
      name: 'Dentist',
      desc: '',
      args: [],
    );
  }

  /// `Child Care`
  String get ChildCare {
    return Intl.message(
      'Child Care',
      name: 'ChildCare',
      desc: '',
      args: [],
    );
  }

  /// `Water`
  String get Water {
    return Intl.message(
      'Water',
      name: 'Water',
      desc: '',
      args: [],
    );
  }

  /// `Telephone`
  String get Telephone {
    return Intl.message(
      'Telephone',
      name: 'Telephone',
      desc: '',
      args: [],
    );
  }

  /// `TV`
  String get TV {
    return Intl.message(
      'TV',
      name: 'TV',
      desc: '',
      args: [],
    );
  }

  /// `Rent`
  String get Rent {
    return Intl.message(
      'Rent',
      name: 'Rent',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get Maintenance {
    return Intl.message(
      'Maintenance',
      name: 'Maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Loan`
  String get Loan {
    return Intl.message(
      'Loan',
      name: 'Loan',
      desc: '',
      args: [],
    );
  }

  /// `Internet`
  String get Internet {
    return Intl.message(
      'Internet',
      name: 'Internet',
      desc: '',
      args: [],
    );
  }

  /// `Insurance`
  String get Insurance {
    return Intl.message(
      'Insurance',
      name: 'Insurance',
      desc: '',
      args: [],
    );
  }

  /// `Electricity`
  String get Electricity {
    return Intl.message(
      'Electricity',
      name: 'Electricity',
      desc: '',
      args: [],
    );
  }

  /// `Groceries`
  String get Groceries {
    return Intl.message(
      'Groceries',
      name: 'Groceries',
      desc: '',
      args: [],
    );
  }

  /// `Restaurant`
  String get Restaurant {
    return Intl.message(
      'Restaurant',
      name: 'Restaurant',
      desc: '',
      args: [],
    );
  }

  /// `Drinks`
  String get Drinks {
    return Intl.message(
      'Drinks',
      name: 'Drinks',
      desc: '',
      args: [],
    );
  }

  /// `Coffee`
  String get Coffee {
    return Intl.message(
      'Coffee',
      name: 'Coffee',
      desc: '',
      args: [],
    );
  }

  /// `Candy`
  String get Candy {
    return Intl.message(
      'Candy',
      name: 'Candy',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get Subscription {
    return Intl.message(
      'Subscription',
      name: 'Subscription',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get Sports {
    return Intl.message(
      'Sports',
      name: 'Sports',
      desc: '',
      args: [],
    );
  }

  /// `Nightclub`
  String get Nightclub {
    return Intl.message(
      'Nightclub',
      name: 'Nightclub',
      desc: '',
      args: [],
    );
  }

  /// `Hobby`
  String get Hobby {
    return Intl.message(
      'Hobby',
      name: 'Hobby',
      desc: '',
      args: [],
    );
  }

  /// `Gym`
  String get Gym {
    return Intl.message(
      'Gym',
      name: 'Gym',
      desc: '',
      args: [],
    );
  }

  /// `Vacation`
  String get Vacation {
    return Intl.message(
      'Vacation',
      name: 'Vacation',
      desc: '',
      args: [],
    );
  }

  /// `Electronics`
  String get Electronics {
    return Intl.message(
      'Electronics',
      name: 'Electronics',
      desc: '',
      args: [],
    );
  }

  /// `Cinema`
  String get Cinema {
    return Intl.message(
      'Cinema',
      name: 'Cinema',
      desc: '',
      args: [],
    );
  }

  /// `Bowling`
  String get Bowling {
    return Intl.message(
      'Bowling',
      name: 'Bowling',
      desc: '',
      args: [],
    );
  }

  /// `Student Loan`
  String get StudentLoan {
    return Intl.message(
      'Student Loan',
      name: 'StudentLoan',
      desc: '',
      args: [],
    );
  }

  /// `Healthcare`
  String get Healthcare {
    return Intl.message(
      'Healthcare',
      name: 'Healthcare',
      desc: '',
      args: [],
    );
  }

  /// `Bank Cost`
  String get BankCost {
    return Intl.message(
      'Bank Cost',
      name: 'BankCost',
      desc: '',
      args: [],
    );
  }

  /// `Clothes`
  String get Clothes {
    return Intl.message(
      'Clothes',
      name: 'Clothes',
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