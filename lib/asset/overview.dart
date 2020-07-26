import 'package:flutter/material.dart';
import 'package:vara/utils/app_theme.dart';
import '../utils/color_theme.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: AppTheme.leftRightPadding,
            right: AppTheme.leftRightPadding,
            top: 18,
            bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: ColorTheme.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topRight: Radius.circular(8.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: ColorTheme.grey.withOpacity(0.2),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 16,
                    left: AppTheme.leftRightPadding,
                    right: AppTheme.leftRightPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 58,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    color: HexColor('#87A0E5').withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4, bottom: 2),
                                        child: Text(
                                          'Net Income',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            //fontFamily: AppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            letterSpacing: -0.1,
                                            color: ColorTheme.lightText,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, top: 10, bottom: 3),
                                            child: Text(
                                              '€${(1523.00).toStringAsFixed(2)}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                // fontFamily:
                                                //     AppTheme.fontName,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24,
                                                color: HexColor("#8A98E8"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: AppTheme.leftRightPadding),
                      child: Center(
                        child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: ColorTheme.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                  border: new Border.all(
                                      width: 4,
                                      color: ColorTheme.nearlyDarkBlue
                                          .withOpacity(0.2)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${(31.23).toStringAsFixed(2)}%',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        //fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 24,
                                        letterSpacing: 0.0,
                                        color: ColorTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                    Text(
                                      'Debt service ratio',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        //fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        letterSpacing: 0.0,
                                        color: ColorTheme.grey.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 8, bottom: 8),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: ColorTheme.background,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 8, bottom: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Income',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              letterSpacing: -0.2,
                              color: ColorTheme.lightText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              height: 4,
                              width: 70,
                              decoration: BoxDecoration(
                                color: HexColor('#87A0E5').withOpacity(0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: ((70 / 1.2)),
                                    height: 4,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        HexColor('#87A0E5'),
                                        HexColor('#87A0E5').withOpacity(0.5),
                                      ]),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              '€${(523.00).toStringAsFixed(2)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                //fontFamily: AppTheme.fontName,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: ColorTheme.assets,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Expenditure',
                                style: TextStyle(
                                  //fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: -0.2,
                                  color: ColorTheme.lightText,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 0, top: 4),
                                child: Container(
                                  height: 4,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: HexColor('#F1B440').withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: ((70 / 2.5)),
                                        height: 4,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            HexColor('#F1B440')
                                                .withOpacity(0.1),
                                            HexColor('#F1B440'),
                                          ]),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  '-€${(523.00).toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    //fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: ColorTheme.debt,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
