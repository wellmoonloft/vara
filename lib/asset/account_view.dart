import 'package:flutter/material.dart';

import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class AccountView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const AccountView({Key key, this.animationController, this.animation})
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
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: AppTheme.outboxpadding,
                              decoration: BoxDecoration(
                                color: ColorTheme.cassis.withOpacity(0.6),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    padding: EdgeInsets.only(
                                        left: 0, right: 30, top: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Invest Account",
                                          style: AppTheme.toptitleBigText,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '444',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: -1.0,
                                            fontSize: 26,
                                            color: ColorTheme.white,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Date:",
                                              style: AppTheme.toptitleText,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '2020-10-10',
                                              style: AppTheme.toptitleText,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -14,
                                    right: -10,
                                    child: IconButton(
                                        icon: Icon(Icons.add), onPressed: null),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: AppTheme.outboxpadding,
                              decoration: BoxDecoration(
                                color: ColorTheme.cantaloupelighter,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    padding: EdgeInsets.only(
                                        left: 0, right: 30, top: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Cash Account",
                                          style: AppTheme.toptitleBigText,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '444',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: -1.0,
                                            fontSize: 26,
                                            color: ColorTheme.white,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Date:",
                                              style: AppTheme.toptitleText,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '2020-10-10',
                                              style: AppTheme.toptitleText,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: -14,
                                    right: -10,
                                    child: IconButton(
                                        icon: Icon(Icons.add), onPressed: null),
                                  ),
                                ],
                              ),
                            )
                          ]))));
        });
  }
}
