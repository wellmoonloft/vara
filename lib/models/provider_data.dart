import 'package:flutter/material.dart';
import 'package:vara/utils/db_helper.dart';

import 'db_models.dart';

class ProviderData extends ChangeNotifier {
  List<Invest> investList;
  List<Asset> assetList;
  List<Map> billList;
  String eur;

  setEur(eurData) {
    eur = eurData['5. Exchange Rate'];
    notifyListeners();
    print(eur);
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

  Future updateBill(Bill bill) async {
    await DBHelper().updateBill(bill);
  }
}
