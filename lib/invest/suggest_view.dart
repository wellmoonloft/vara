import 'package:flutter/material.dart';
import 'package:vara/utils/color_theme.dart';

class SuggestView extends StatelessWidget {
  const SuggestView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 24),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor("#FFFFFF"),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    // boxShadow: <BoxShadow>[
                    //   BoxShadow(
                    //       color: ColorTheme.grey.withOpacity(0.2),
                    //       offset: Offset(1.1, 1.1),
                    //       blurRadius: 10.0),
                    // ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 68, bottom: 12, right: 16, top: 12),
                        child: Text(
                          'In order to achieve freedom of wealth, let us work together.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            //fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            letterSpacing: 0.0,
                            color: ColorTheme.nearlyDarkBlue.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -12,
                left: 0,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset("assets/Images/glass.png"),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
