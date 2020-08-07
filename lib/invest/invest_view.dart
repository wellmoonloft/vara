import 'package:flutter/material.dart';
import 'invest_import.dart';
import 'invest_summary.dart';

class InvestView extends StatefulWidget {
  final List<Map> investList;
  final editParentData;
  const InvestView({Key key, this.investList, this.editParentData})
      : super(key: key);

  @override
  _AssetViewState createState() => _AssetViewState();
}

class _AssetViewState extends State<InvestView> with TickerProviderStateMixin {
  List<Map> _investList;

  @override
  void initState() {
    _investList = widget.investList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            InvestSummaryView(
                editParentData: (investList) {
                  _editParentData(investList);
                },
                investList: _investList),
            InvestImportView(
                editParentData: (investList) {
                  _editParentData(investList);
                },
                investList: _investList),
          ],
        ));
  }

  _editParentData(investList) {
    setState(() {
      _investList = investList;
      widget.editParentData(_investList);
    });
  }
}
