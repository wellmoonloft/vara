import 'package:flutter/material.dart';
import 'package:vara/utils/color_theme.dart';

class InvestTitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;

  const InvestTitleView({
    Key key,
    this.titleTxt: "",
    this.subTxt: "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 12),
        child: Row(
          children: <Widget>[
            Container(
              height: 28,
              width: 4,
              decoration: BoxDecoration(
                color: ColorTheme.darkpink.withOpacity(0.9),
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
                style: TextStyle(
                  //fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  //letterSpacing: 0,
                  color: ColorTheme.nearlyBlack,
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      subTxt,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        //fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        letterSpacing: 0.0,
                        color: ColorTheme.darkpink,
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 26,
                      child: Icon(
                        Icons.arrow_forward,
                        color: ColorTheme.darkText,
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
