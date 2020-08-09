import 'package:flutter/material.dart';
import 'package:vara/utils/db_helper.dart';

import 'db_models.dart';

class InvestData extends ChangeNotifier {
  List<Map> investList;
  List<Map> assetList;

  Future getinvestList() async {
    investList = await DBHelper().getInvest();
    notifyListeners();
  }

  Future updateInvestList(Invest invest) async {
    await DBHelper().updateInvest(invest);
    await getinvestList();
    notifyListeners();
  }

  Future deleteInvest(String investcode) async {
    await DBHelper().deleteInvest(investcode);
    notifyListeners();
  }

  Future getAssetList() async {
    assetList = await DBHelper().getAsset();
    notifyListeners();
  }

  Future updateAsset(Asset asset) async {
    await DBHelper().updateAsset(asset);
    await getAssetList();
    notifyListeners();
  }
}
