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
                                          style: setNoteTitle(
                                              ColorTheme.greydarker)),
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
                                          child: Text(
                                              netAsset.abs() > 100000.00
                                                  ? providerdata
                                                          .currency.iconName +
                                                      ' ' +
                                                      NumberFormat.compact(locale: Intl.getCurrentLocale())
                                                          .format(netAsset *
                                                              animation.value)
                                                  : NumberFormat(
                                                          providerdata.currency
                                                                  .iconName +
                                                              " ###,###.00",
                                                          Intl
                                                              .getCurrentLocale())
                                                      .format(netAsset *
                                                          animation.value),
                                              textAlign: TextAlign.center,
                                              style: setHomeNumnberText(
                                                  ColorTheme.greytripledarker)),
                                        ),
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
                                      color: ColorTheme.puristbluedarker,
                                      subcolor: ColorTheme.puristbluelighter,
                                      mark: true,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: AppTheme.chartTitlepadding,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        S.current.Asset,
                                        textAlign: TextAlign.start,
                                        style:
                                            setNoteTitle(ColorTheme.greydarker),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6, bottom: 6),
                                        child: Text(
                                            providerdata.currency.iconName +
                                                ' ' +
                                                NumberFormat.compact(
                                                        locale: Intl
                                                            .getCurrentLocale())
                                                    .format(asset *
                                                        animation.value),
                                            textAlign: TextAlign.start,
                                            style: setTitleText(
                                                ColorTheme.cassis)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: AppTheme.chartTitlepadding,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        S.current.Debt,
                                        textAlign: TextAlign.end,
                                        style:
                                            setNoteTitle(ColorTheme.greydarker),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6, bottom: 6),
                                        child: Text(
                                            providerdata.currency.iconName +
                                                ' ' +
                                                NumberFormat.compact(
                                                        locale: Intl
                                                            .getCurrentLocale())
                                                    .format(
                                                        debt * animation.value),
                                            textAlign: TextAlign.end,
                                            style: setTitleText(
                                                ColorTheme.cantaloupe)),
                                      ),
                                    ],
                                  ),
                                )
                              ])
                        ])));
                  })));
        });
  }
}
