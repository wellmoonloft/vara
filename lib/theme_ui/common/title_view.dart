import 'package:flutter/material.dart';
import 'package:vara/invest/invest_list.dart';
import 'package:vara/bill/bill_list.dart';
import '../app_theme.dart';
import '../color_theme.dart';

class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final String navigator;
  final AnimationController animationController;
  final Animation animation;
  const TitleView(
      {Key key,
      this.titleTxt: "",
      this.subTxt: "",
      this.animationController,
      this.animation,
      this.navigator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Container(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      titleTxt,
                      textAlign: TextAlign.left,
                      style: AppTheme.subPageTitle,
                    ),
                    InkWell(
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
                              style: AppTheme.noteTitle,
                            ),
                            subTxt == ''
                                ? SizedBox()
                                : SizedBox(
                                    height: 38,
                                    width: 26,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: ColorTheme.greylighter,
                                      size: 16,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

_navigator(context, navigator) {
  if (navigator == 'invest') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InvestListView()),
    );
  } else if (navigator == 'bill') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BillListView()),
    );
  } else {}
}
