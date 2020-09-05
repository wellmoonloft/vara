import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';

class AssetSummaryView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const AssetSummaryView({Key key, this.animationController, this.animation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
              opacity: animation,
              child: Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation.value), 0.0),
                  child: Consumer<ProviderData>(
                      builder: (context, providerdata, child) {
                    double netAsset = 0.0;
                    double asset = 0.0;
                    double debt = 0.0;
                    double debtService = 0.0;
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
                      netAsset = asset - debt;

                      if (asset == 0 || debt == 0) {
                        debtService = 0;
                      } else {
                        debtService = debt / asset;
                      }
                    }
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(bottom: 20),
                        child: Container(
                            // decoration: AppTheme.boxDecoration,
                            child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 0, top: 16, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 2),
                                      child: Text(S.current.NetAsset,
                                          textAlign: TextAlign.center,
                                          style: AppTheme.noteTitle),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, top: 5),
                                            child: NumbersText(
                                                value:
                                                    netAsset * animation.value,
                                                style: AppTheme.mainNumbers,
                                                currency: providerdata
                                                    .currency.iconName)),
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: AppTheme.leftRightPadding),
                                  child: Center(
                                    child: SummaryTopGraph(
                                      title: S.current.DebtService,
                                      value: debtService * animation.value,
                                      mark: true,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: ColorTheme.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(100.0),
                                              ),
                                              border: new Border.all(
                                                  width: 4,
                                                  color:
                                                      ColorTheme.greenlighter),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 14, left: 14),
                                              child: FaIcon(
                                                FontAwesomeIcons.sortUp,
                                                color: ColorTheme.greenlighter,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              S.current.Asset,
                                              textAlign: TextAlign.start,
                                              style: AppTheme.noteTitle,
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 6, bottom: 6),
                                                child: NumbersText(
                                                  value: asset,
                                                  style: AppTheme.subNumbers,
                                                  currency: providerdata
                                                      .currency.iconName,
                                                )),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: ColorTheme.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(100.0),
                                              ),
                                              border: new Border.all(
                                                  width: 4,
                                                  color: ColorTheme.redlighter),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4, left: 14),
                                              child: FaIcon(
                                                FontAwesomeIcons.sortDown,
                                                color: ColorTheme.redlighter,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              S.current.Debt,
                                              textAlign: TextAlign.end,
                                              style: AppTheme.noteTitle,
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 6, bottom: 6),
                                                child: NumbersText(
                                                  value: debt,
                                                  style: AppTheme.subNumbers,
                                                  currency: providerdata
                                                      .currency.iconName,
                                                )),
                                          ],
                                        )
                                      ],
                                    ))
                              ])
                        ])));
                  })));
        });
  }
}
