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
                    double asset = 0.0;
                    double debt = 0.0;
                    num rate = 1;
                    if (providerdata.assetList != null) {
                      providerdata.assetList.forEach((element) {
                        providerdata.currencyData.forEach((element1) {
                          if (element.currency == element1.short) {
                            rate = providerdata.currency.rate / element1.rate;
                            asset = asset + element.asset * rate;
                            debt = debt + element.debt * rate;
                          }
                        });
                      });
                    }
                    return Container(
                        height: 85,
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
                                      'Asset',
                                      textAlign: TextAlign.start,
                                      style: AppTheme.titleTextSmallLighter,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6, bottom: 6),
                                      child: Text(
                                        NumberFormat(
                                                providerdata.currency.iconName +
                                                    " ###,###.0#",
                                                "en_US")
                                            .format(asset * animation.value),
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
                              Padding(
                                padding: AppTheme.chartTitlepadding,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Debt',
                                      textAlign: TextAlign.end,
                                      style: AppTheme.titleTextSmallLighter,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 6, bottom: 6),
                                      child: Text(
                                        NumberFormat(
                                                providerdata.currency.iconName +
                                                    " ###,###.0#",
                                                "en_US")
                                            .format(debt * animation.value),
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: -1.0,
                                          fontSize: 26,
                                          color: ColorTheme.cantaloupe,
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
