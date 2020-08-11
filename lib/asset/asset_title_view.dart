import 'package:flutter/material.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/app_theme.dart';

class AssetTitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;

  const AssetTitleView({
    Key key,
    this.titleTxt: "",
    this.subTxt: "",
  }) : super(key: key);

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
                color: ColorTheme.puristbluedarker,
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
          ],
        ),
      ),
    );
  }
}
