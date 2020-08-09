import 'package:flutter/material.dart';
import 'package:vara/invest/list/invest_list.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/app_theme.dart';

class InvestTitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  //final List<Map> investList;

  const InvestTitleView({
    Key key,
    this.titleTxt: "",
    this.subTxt: "",
    //this.investList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: boxpadding,
        child: Row(
          children: <Widget>[
            Container(
              height: 28,
              width: 4,
              decoration: BoxDecoration(
                color: ColorTheme.cassislighter.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                titleTxt,
                textAlign: TextAlign.left,
                style: titleText,
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new InvestListView()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      subTxt,
                      textAlign: TextAlign.left,
                      style: subtitleText,
                    ),
                    SizedBox(
                      height: 38,
                      width: 26,
                      child: Icon(
                        Icons.arrow_forward,
                        color: ColorTheme.greydarker,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
