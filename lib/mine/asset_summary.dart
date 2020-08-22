import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import '../theme_ui/color_theme.dart';

class PersonalSummaryView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const PersonalSummaryView({Key key, this.animationController, this.animation})
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
                    if (providerdata.assetList != null) {
                      providerdata.assetList.forEach((element) {
                        asset = asset + element.asset;
                        debt = debt + element.debt;
                      });
                      netAsset = asset - debt;
                      debtService = debt / asset;
                      //print(debtService);
                    }
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                            //decoration: AppTheme.boxDecoration,
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
                                            title: 'User Name',
                                            value: 'Lee Nan',
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
                                      child: Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                height: 80,
                                                width: 80,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: ColorTheme.pale,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: FaIcon(
                                                  FontAwesomeIcons.userAlt,
                                                  color: ColorTheme.white,
                                                )),
                                          ),
                                        ],
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
