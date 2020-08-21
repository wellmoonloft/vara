import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class ChartTitle extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const ChartTitle({Key key, this.animationController, this.animation})
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
                  child: Consumer<ProviderData>(
                      builder: (context, providerdata, child) {
                    double income = 0.0;
                    double expenses = 0.0;

                    if (providerdata.billList != null) {
                      providerdata.billList.forEach((element) {
                        if (element.mark == 0) {
                          expenses = expenses + element.amount;
                        } else {
                          income = income + element.amount;
                        }
                      });
                    }
                    return Container(
                        height: 80,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Padding(
                                padding: AppTheme.chartTitlepadding,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Income',
                                      textAlign: TextAlign.start,
                                      style: AppTheme.titleTextSmallLighter,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6, bottom: 6),
                                      child: Text(
                                        NumberFormat("€ ###,###.0#", "en_US")
                                            .format(income * animation.value),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: -1.0,
                                          fontSize: 26,
                                          color: ColorTheme.neogreendarker,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: AppTheme.chartTitlepadding,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Expenses',
                                      textAlign: TextAlign.end,
                                      style: AppTheme.titleTextSmallLighter,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6, bottom: 6),
                                      child: Text(
                                        NumberFormat("€ ###,###.0#", "en_US")
                                            .format(expenses * animation.value),
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: -1.0,
                                          fontSize: 26,
                                          color: ColorTheme.darkred,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]));
                  })));
        });
  }
}
