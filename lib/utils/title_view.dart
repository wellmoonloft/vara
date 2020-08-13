import 'package:flutter/material.dart';
import 'package:vara/bill/bill_list.dart';
import 'package:vara/invest/list/invest_list.dart';

import 'app_theme.dart';
import 'color_theme.dart';

class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final Color color;
  final String navigator;

  const TitleView(
      {Key key, this.titleTxt: "", this.subTxt: "", this.color, this.navigator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: AppTheme.outboxpadding,
        child: Row(
          children: <Widget>[
            Container(
              height: 28,
              width: 4,
              decoration: BoxDecoration(
                color: color.withOpacity(0.8),
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
                style: AppTheme.titleText,
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: () {
                _navigator(context, navigator);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      subTxt,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: color,
                      ),
                    ),
                    subTxt == ''
                        ? SizedBox()
                        : SizedBox(
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

_navigator(context, navigator) {
  if (navigator == 'invest') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new InvestListView()),
    );
  } else if (navigator == 'bill') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new BillListView()),
    );
  } else {}
}
