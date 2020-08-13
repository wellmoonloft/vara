import 'package:flutter/material.dart';
import 'package:vara/utils/db_helper.dart';

import 'db_models.dart';

class InvestData extends ChangeNotifier {
  List<Map> investList;
  List<Map> assetList;
  List<Map> billList;

  Future getinvestList() async {
    investList = await DBHelper().getInvest();
    notifyListeners();
  }

  Future updateInvestList(Invest invest) async {
    await DBHelper().updateInvest(invest);
    await getinvestList();
    notifyListeners();
  }

  Future deleteInvest(String code) async {
    await DBHelper().deleteInvest(code);
    notifyListeners();
  }

  Future getAssetList() async {
    assetList = await DBHelper().getAsset();
    notifyListeners();
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
