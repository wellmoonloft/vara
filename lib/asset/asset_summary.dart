import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/utils/app_theme.dart';
import 'package:vara/utils/app_ui.dart';
import 'package:vara/utils/toolkit.dart';
import '../utils/color_theme.dart';

class AssetSummaryView extends StatelessWidget {
  //final List<Map> asset;
  const AssetSummaryView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double netAsset = 0.0;
    double asset = 0.0;
    double debt = 0.0;
    double debtService = 0.0;
    Provider.of<InvestData>(context).assetList.forEach((element) {
      asset = asset + element['asset'];
      debt = debt + element['debt'];
    });
    netAsset = asset - debt;
    debtService = debt / asset;
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: AppTheme.outboxpadding,
            child: Container(
              decoration: boxDecoration,
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
                                    color: ColorTheme.puristbluedarker,
                                    width: 3,
                                    height: 50),
                                SummaryTopTitile(
                                  title: 'Net Asset',
                                  value:
                                      '€ ' + formatNum(netAsset, 2).toString(),
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
                              title: 'Debt service',
                              value: debtService,
                              color: ColorTheme.puristbluedarker,
                              subcolor: ColorTheme.puristbluelighter,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppTheme.inboxpadding,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: ColorTheme.background,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppTheme.inboxpadding,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SummaryBottom(
                            title: 'Asset',
                            subtitle: '',
                            value: '€ ' + formatNum(asset, 2).toString(),
                            color: ColorTheme.puristbluedarker,
                            subcolor: '#87A0E5',
                          ),
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SummaryBottom(
                              title: 'Debt',
                              subtitle: '',
                              value: '€ ' + formatNum(debt, 2).toString(),
                              color: ColorTheme.cantaloupe,
                              subcolor: '#F1B440',
                            )
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
