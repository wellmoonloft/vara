import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vara/utils/db_helper.dart';
import 'dart:io';
import 'db_models.dart';
import 'dart:convert';
import 'default_data.dart';

class ProviderData extends ChangeNotifier {
  List<Invest> investList;
  List<Asset> assetList;
  List<Bill> billList;
  List<CurrencyData> currencyData = CurrencyData.currencyList;
  CurrencyData currency;
  Person person;
  MayStoreage mayStoreage;

  Future<File> _getLocalFile() async {
    String _dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$_dir/storeage.json');
  }

  Future<MayStoreage> getMayStoreage() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      mayStoreage = MayStoreage.fromJson(json.decode(contents));
      return mayStoreage;
    } on FileSystemException {
      MayStoreage storeage = MayStoreage();
      storeage.isCloud = 0;
      storeage.path = (await getApplicationDocumentsDirectory()).path;
      await setMayStoreage(storeage);
      return storeage;
    }
  }

  Future setMayStoreage(MayStoreage _storeage) async {
    mayStoreage.isCloud = _storeage.isCloud;
    mayStoreage.path = _storeage.path;
    await (await _getLocalFile()).writeAsString(mayStoreage.toJson());
    notifyListeners();
  }

  setCurrencyData(eurData, currencyTilte) {
    currencyData.forEach((element) {
      if (eurData[element.short] != null) {
        element.rate = eurData[element.short];
        // print(element.short);
        // print(element.rate);
      }
      if (element.short == currencyTilte) {
        currency = element;
      }
    });
    notifyListeners();
  }

  Future getPerson() async {
    person = await DBHelper().getPerson();
    notifyListeners();
  }

  Future setPerson(Person _person) async {
    await DBHelper().updatePerson(_person);
    notifyListeners();
  }

  setCurrency(String short) {
    currencyData.forEach((element) {
      if (element.short == short) {
        currency = element;
      }
    });
    notifyListeners();
  }

  Future getinvestList() async {
    investList = await DBHelper().getInvestList();
    notifyListeners();
    return investList;
  }

  Future updateInvest(Invest invest) async {
    await DBHelper().updateInvest(invest);
  }

  Future updateInvestandData(Invest invest) async {
    await DBHelper().updateInvestandData(invest);
  }

  Future deleteInvest(Invest invest) async {
    await DBHelper().deleteInvest(invest);
    notifyListeners();
  }

  Future getAssetList() async {
    assetList = await DBHelper().getAsset();
    notifyListeners();
  }

  Future updateAsset(Asset asset) async {
    await DBHelper().updateAsset(asset);
  }

  Future getBillList() async {
    billList = await DBHelper().getBill();
    notifyListeners();
  }

  Future insertBill(Bill bill) async {
    await DBHelper().insertBill(bill);
  }

  Future deleteBill(Bill bill) async {
    await DBHelper().deleteBill(bill);
  }
}
