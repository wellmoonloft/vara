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
                              decoration: AppTheme.boxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          style: AppTheme.titleTextSmallLighter,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'card.cardNo',
                                          style: AppTheme.subtitleText,
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Expires",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey.shade400,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'card.expiryDate',
                                              style: AppTheme.subtitleText,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 15,
                                    right: 0,
                                    child: Container(
                                      height: 25,
                                      width: 50,
                                      color: Colors.pink,
                                      padding: EdgeInsets.all(7),
                                      // child: Image.network(
                                      //   card.logo,
                                      //   width: 50,
                                      //   color: Colors.white,
                                      // ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6, bottom: 6),
                                    child: Text(
                                      '444',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: -1.0,
                                        fontSize: 26,
                                        color: ColorTheme.cassis,
                                      ),
                                    ),
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
                              decoration: AppTheme.boxDecoration,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          style: AppTheme.titleTextSmallLighter,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'card.cardNo',
                                          style: AppTheme.subtitleText,
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Expires",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey.shade400,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'card.expiryDate',
                                              style: AppTheme.subtitleText,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 15,
                                    right: 0,
                                    child: Container(
                                      height: 25,
                                      width: 50,
                                      color: Colors.pink,
                                      padding: EdgeInsets.all(7),
                                      // child: Image.network(
                                      //   card.logo,
                                      //   width: 50,
                                      //   color: Colors.white,
                                      // ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6, bottom: 6),
                                    child: Text(
                                      '444',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: -1.0,
                                        fontSize: 26,
                                        color: ColorTheme.cassis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]))));
        });
  }
}
