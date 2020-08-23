import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import '../theme_ui/color_theme.dart';

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
                            child: Column(
                          children: <Widget>[
                            Padding(
                              padding: AppTheme.outboxpadding,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 4),
                                      child: Row(
                                        children: <Widget>[
                                          BeforeTitle(
                                              color:
                                                  ColorTheme.puristbluedarker,
                                              width: 3,
                                              height: 50),
                                          SummaryTopTitile(
                                            title: S.current.NetAsset,
                                            value: netAsset.abs() > 100000.00
                                                ? providerdata
                                                        .currency.iconName +
                                                    ' ' +
                                                    NumberFormat.compact(
                                                            locale: Intl
                                                                .getCurrentLocale())
                                                        .format(netAsset *
                                                            animation.value)
                                                : NumberFormat(
                                                        providerdata.currency
                                                                .iconName +
                                                            " ###,###.0#",
                                                        Intl.getCurrentLocale())
                                                    .format(netAsset *
                                                        animation.value),
                                            color: ColorTheme.puristbluedarker,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: AppTheme.leftRightPadding),
                                    child: Center(
                                      child: SummaryTopGraph(
                                        title: S.current.DebtService,
                                        value: debtService * animation.value,
                                        color: ColorTheme.puristbluedarker,
                                        subcolor: ColorTheme.puristbluelighter,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )));
                  })));
        });
  }
}
