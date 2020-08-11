import 'package:flutter/material.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/app_theme.dart';

class InvestDetail extends StatelessWidget {
  final Map<dynamic, dynamic> investdetail;

  const InvestDetail({Key key, this.investdetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: ColorTheme.white,
        elevation: 0,
        title: Text('Invest Detail', style: AppTheme.titleText),
        leading: BackButton(
            color: ColorTheme.greytripledarker,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                investdetail['investcode'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorTheme.greydarker,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                investdetail['id'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorTheme.greydarker,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
