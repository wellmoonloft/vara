import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/line_chart_view.dart';

class TopBarView extends StatefulWidget {
  final String title;

  TopBarView({Key key, this.title}) : super(key: key);

  @override
  TopBarState createState() => TopBarState();
}

class TopBarState extends State<TopBarView>
    with SingleTickerProviderStateMixin {
  List bannerTab = [
    'assets/Images/banner_tab1.jpg',
    'assets/Images/banner_tab2.jpg',
    'assets/Images/banner_tab3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
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
                          'Today',
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
                          '25',
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
                        color: ColorTheme.nearlyBlack,
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
                          child:
                              new Icon(Icons.search, color: ColorTheme.white))),
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
                  color: ColorTheme.nearlyBlack,
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
                            padding: EdgeInsets.only(top: 10),
                            child: Stack(
                                alignment: Alignment.bottomRight,
                                children: <Widget>[
                                  Text(
                                    '25',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      //fontFamily: AppTheme.fontName,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 28,
                                      letterSpacing: 1.2,
                                      color: ColorTheme.black,
                                    ),
                                  ),
                                  LineChartView()
                                ])));
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
