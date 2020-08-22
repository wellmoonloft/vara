import 'package:flutter/material.dart';
import 'package:vara/utils/db_helper.dart';

import 'db_models.dart';
import 'default_data.dart';

class ProviderData extends ChangeNotifier {
  List<Invest> investList;
  List<Asset> assetList;
  List<Bill> billList;
  List<CurrencyData> currencyData = CurrencyData.currencyList;
  CurrencyData currency;

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
