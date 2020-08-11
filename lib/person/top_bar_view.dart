import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/home/top/btc_chart_view.dart';
import 'package:vara/utils/app_theme.dart';

class TopBarView extends StatelessWidget {
  final String title;
  final Map<String, dynamic> btcdaily;
  final Map<String, dynamic> usdcnydaily;
  final Map<String, dynamic> eurcnydaily;
  TopBarView(
      {Key key, this.title, this.btcdaily, this.usdcnydaily, this.eurcnydaily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String btcPrice = '';

    if (btcdaily != null) {
      Map<String, dynamic> btc =
          btcdaily[DateFormat('yyyy-MM-dd').format(DateTime.now())];
      btcPrice = 'BTC/USD: ' +
          double.parse(
                  btc['4b. close (USD)'] != null ? btc['4b. close (USD)'] : 0.0)
              .toStringAsFixed(2);
    }

    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, left: 14),
              child: Container(
                height:
                    (MediaQuery.of(context).size.width * 0.3 - 32) * 1.5 + 10,
                width: MediaQuery.of(context).size.width * 0.7 - 8,
                decoration: boxDecoration,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Images/banner_tab1.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(top: 60, left: 24),
                        child: Stack(
                            alignment: Alignment.centerLeft,
                            children: <Widget>[
                              BtcChartView(btcdaily: btcdaily),
                              Text(
                                'Person Name',
                                textAlign: TextAlign.start,
                                style: AppTheme.toptitleBigText,
                              ),
                            ]))),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 16),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.3 - 32,
                    width: MediaQuery.of(context).size.width * 0.3 - 38,
                    decoration: BoxDecoration(
                      color: ColorTheme.puristbluedarker,
                      borderRadius: AppTheme.normalBorderRadius,
                      boxShadow: <BoxShadow>[
                        normalBoxShadow,
                      ],
                      // image: DecorationImage(
                      //     fit: BoxFit.fill,
                      //     image: AssetImage('assets/Images/datebg.jpg')),
                    ),
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          'News',
                          textAlign: TextAlign.center,
                          style: AppTheme.toptitleBigText,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Icon(
                            Icons.message,
                            color: ColorTheme.white,
                            size: 28,
                          ))
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14, left: 16),
                  child: Container(
                      height:
                          (MediaQuery.of(context).size.width * 0.3 - 40) / 2,
                      width: MediaQuery.of(context).size.width * 0.3 - 38,
                      decoration: BoxDecoration(
                        color: ColorTheme.cassisdarker,
                        borderRadius: AppTheme.normalBorderRadius,
                        boxShadow: <BoxShadow>[
                          normalBoxShadow,
                        ],
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          widthFactor: 2.0,
                          heightFactor: 2.0,
                          child:
                              Icon(Icons.settings, color: ColorTheme.white))),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
