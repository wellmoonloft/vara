import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
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
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 16, bottom: 20),
                            child: Column(children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 2),
                                        child: Text(S.current.NetAsset,
                                            textAlign: TextAlign.center,
                                            style: AppTheme.noteTitle),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 5),
                                          child: NumbersText(
                                              value: netAsset * animation.value,
                                              style: AppTheme.mainNumbers,
                                              currency: providerdata
                                                  .currency.iconName)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
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
                              SizedBox(
                                height: 20,
                              ),
                              SummaryBox(
                                title1: S.current.Asset,
                                title2: S.current.Debt,
                                value1: asset * animation.value,
                                value2: debt * animation.value,
                                currency: providerdata.currency.iconName,
                                mark: false,
                              )
                            ])));
                  })));
        });
  }
}
