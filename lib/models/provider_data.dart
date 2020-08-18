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
    investList = await DBHelper().getInvest();
    notifyListeners();
  }

  Future updateInvest(Invest invest) async {
    await DBHelper().updateInvest(invest);
    await getinvestList();
    notifyListeners();
  }

  Future updateInvestandAseet(Invest invest) async {
    await DBHelper().updateInvestandAseet(invest);
  }

  Future deleteInvest(Invest invest) async {
    await DBHelper().deleteInvest(invest);
    notifyListeners();
  }

  Future getAssetList() async {
    assetList = await DBHelper().getAsset();
    return assetList;
  }

  Future updateAsset(Asset asset) async {
    await DBHelper().updateAsset(asset);
    notifyListeners();
  }

  Future getBillList() async {
    billList = await DBHelper().getBill();
    notifyListeners();
  }

  Future updateBill(Bill bill) async {
    await DBHelper().updateBill(bill);
    notifyListeners();
  }
}
