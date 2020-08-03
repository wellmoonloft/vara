import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/home/top/btc_chart_view.dart';
import 'eur_chart_view.dart';
import 'usd_chart_view.dart';

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
    List bannerTab = [
      'assets/Images/banner_tab1.jpg',
      'assets/Images/banner_tab2.jpg',
      'assets/Images/banner_tab3.jpg'
    ];
    Map<String, dynamic> btc =
        btcdaily[DateFormat('yyyy-MM-dd').format(DateTime.now())];

    Map<String, dynamic> usd;
    Map<String, dynamic> eur;
    for (var i = 0; i < 10; i++) {
      if (usdcnydaily[DateFormat('yyyy-MM-dd')
              .format(DateTime.now().subtract(new Duration(days: i)))] !=
          null) {
        usd = usdcnydaily[DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(new Duration(days: i)))];
        eur = eurcnydaily[DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(new Duration(days: i)))];
        break;
      }
    }

    // print(usd);
    // print(eur);

    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 16),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.3 - 32,
                    width: MediaQuery.of(context).size.width * 0.3 - 38,
                    decoration: BoxDecoration(
                      color: ColorTheme.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: ColorTheme.grey.withOpacity(0.2),
                            offset: Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/Images/datebg.jpg')),
                    ),
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          DateFormat('MMMM').format(DateTime.now()),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            letterSpacing: 0,
                            color: ColorTheme.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          DateFormat('dd').format(DateTime.now()),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            letterSpacing: 1.2,
                            color: ColorTheme.white,
                          ),
                        ),
                      )
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: ColorTheme.grey.withOpacity(0.2),
                              offset: Offset(1.1, 1.1),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        widthFactor: 2.0,
                        heightFactor: 2.0,
                        child: Text(
                          DateFormat('EEEE').format(DateTime.now()),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 1.2,
                            color: ColorTheme.white,
                          ),
                        ),
                        //new Icon(Icons.search, color: ColorTheme.white)
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 14),
              child: Container(
                height:
                    (MediaQuery.of(context).size.width * 0.3 - 32) * 1.5 + 10,
                width: MediaQuery.of(context).size.width * 0.7 - 8,
                decoration: BoxDecoration(
                  color: ColorTheme.greytripledarker,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: ColorTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(bannerTab[index]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(top: 10, right: 10),
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: <Widget>[
                                    BtcChartView(btcdaily: btcdaily),
                                    Text(
                                      'BTC/USD: ' +
                                          double.parse(btc['4b. close (USD)'])
                                              .toStringAsFixed(2),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        //fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        color: ColorTheme.white,
                                      ),
                                    ),
                                  ])));
                    } else if (index == 1) {
                      return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(bannerTab[index]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(top: 10, right: 10),
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: <Widget>[
                                    USDChartView(usdcnydaily: usdcnydaily),
                                    Text(
                                      'USD/CNY: ' +
                                          double.parse(usd['4. close'])
                                              .toStringAsFixed(2),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        //fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        color: ColorTheme.white,
                                      ),
                                    ),
                                  ])));
                    } else if (index == 2) {
                      return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(bannerTab[index]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(top: 10, right: 10),
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: <Widget>[
                                    EURChartView(eurcnydaily: eurcnydaily),
                                    Text(
                                      'EUR/CNY: ' +
                                          double.parse(eur['4. close'])
                                              .toStringAsFixed(2),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        //fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        color: ColorTheme.white,
                                      ),
                                    ),
                                  ])));
                    } else {
                      return Container();
                    }
                  },
                  itemCount: 3,
                  pagination: new SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                    color: ColorTheme.transparent,
                    activeColor: ColorTheme.transparent,
                  )),
                  // onTap: ,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
