import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../asset/asset_page.dart';
import '../invest/invest_screen.dart';
import '../models/tab_icon_data.dart';
import '../secont.dart';
import 'bottom_bar_view.dart';
import '../utils/color_theme.dart';

class HomeView extends StatefulWidget {
  final String title;

  HomeView({Key key, this.title}) : super(key: key);

  @override
  _StickyDemoState createState() => _StickyDemoState();
}

class _StickyDemoState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  ScrollController _controller = new ScrollController();
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  bool _offstage = true;
  Widget tabBody = Container(
    color: ColorTheme.background,
  );
  List bannerTab = [
    'assets/Images/banner_tab1.jpg',
    'assets/Images/banner_tab2.jpg',
    'assets/Images/banner_tab3.jpg'
  ];
  @override
  void initState() {
    super.initState();
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    //tabIconsList[0].isSelected = true;
    tabBody = InvestPage();

    _controller.addListener(() {
      //print(_controller.offset);
      if (_controller.offset > 115) {
        //_offstage = true;
        setState(() {
          _offstage = false;
        });
      } else if (_controller.offset < 114) {
        //_offstage = false;
        setState(() {
          _offstage = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0.0,
            forceElevated: true,
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            expandedHeight: MediaQuery.of(context).size.width * 0.5 - 30,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              title: Offstage(
                offstage: _offstage,
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width - 32,
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
                    // image: DecorationImage(
                    //     fit: BoxFit.fill,
                    //     image: AssetImage('assets/Images/datebg.jpg')),
                  ),
                  child: Text(
                    'I will put a searching bar here later.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //fontFamily: AppTheme.fontName,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: 1.2,
                      color: ColorTheme.nearlyBlack,
                    ),
                  ),
                ),
              ),
              background: Container(
                //color: Colors.grey,
                child: Column(
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
                                height:
                                    MediaQuery.of(context).size.width * 0.3 -
                                        32,
                                width: MediaQuery.of(context).size.width * 0.3 -
                                    38,
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
                                      image: AssetImage(
                                          'assets/Images/datebg.jpg')),
                                ),
                                child: Column(children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text(
                                      'Today',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        //fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        letterSpacing: 1.2,
                                        color: ColorTheme.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
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
                                      (MediaQuery.of(context).size.width * 0.3 -
                                              40) /
                                          2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3 -
                                          38,
                                  decoration: BoxDecoration(
                                    color: ColorTheme.nearlyBlack,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color:
                                              ColorTheme.grey.withOpacity(0.2),
                                          offset: Offset(1.1, 1.1),
                                          blurRadius: 10.0),
                                    ],
                                  ),
                                  child: Align(
                                      alignment: Alignment.center,
                                      widthFactor: 2.0,
                                      heightFactor: 2.0,
                                      child: new Icon(Icons.search,
                                          color: ColorTheme.white))),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 14),
                          child: Container(
                            height:
                                (MediaQuery.of(context).size.width * 0.3 - 32) *
                                        1.5 +
                                    10,
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
                                );
                              },
                              itemCount: 3,
                              pagination: new SwiperPagination(
                                  builder: DotSwiperPaginationBuilder(
                                color: ColorTheme.white,
                                activeColor: ColorTheme.darkpale,
                              )),
                              // onTap: ,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: bottomBar(),
            ),
          ),
          // SliverFillRemaining(child: tabBody),
          SliverFixedExtentList(
            itemExtent: 250,
            delegate: SliverChildBuilderDelegate((content, index) {
              return Container(
                  //color: Colors.primaries[index % Colors.primaries.length],
                  child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.red,
                    child: Padding(padding: EdgeInsets.all(10)),
                  ),
                  new Container(
                    width: 160.0,
                    color: Colors.blue,
                    child: Text('2'),
                  ),
                  new Container(
                    width: 160.0,
                    color: Colors.green,
                    child: Text('3'),
                  ),
                  new Container(
                    width: 160.0,
                    color: Colors.yellow,
                    child: Text('4'),
                  ),
                  new Container(
                    width: 160.0,
                    color: Colors.orange,
                    child: Text('5'),
                  ),
                ],
              ));
            }, childCount: 4),
          ),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              setState(() {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CustomSliverHeaderDemo()),
                );
                // tabBody =
                //     OverviewScreen(animationController: animationController);
              });
            } else if (index == 1) {
              setState(() {
                // tabBody =
                //     InvestScreen(animationController: animationController);
              });
            } else if (index == 2) {
              setState(() {
                // tabBody = InvestListScreen(
                //     animationController: animationController);
              });
            } else if (index == 3) {
              setState(() {
                // tabBody =
                //     BillScreen(animationController: animationController);
              });
            }
          },
        ),
      ],
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: ColorTheme.white,
      child: this.child,
    );
  }

  @override
  double get maxExtent => 65;

  @override
  double get minExtent => 65;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
