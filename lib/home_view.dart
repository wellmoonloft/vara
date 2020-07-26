import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'asset/asset_page.dart';
import 'invest/invest_screen.dart';
import 'utils/color_theme.dart';

class HomeView extends StatefulWidget {
  final String title;

  HomeView({Key key, this.title}) : super(key: key);

  @override
  _StickyDemoState createState() => _StickyDemoState();
}

class _StickyDemoState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController _controller = new ScrollController();
  int _selectedIndex = 0;
  bool _offstage = true;
  List bannerTab = [
    'assets/Images/banner_tab1.jpg',
    'assets/Images/banner_tab2.jpg',
    'assets/Images/banner_tab3.jpg'
  ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
    tabController.addListener(() {
      setState(() => _selectedIndex = tabController.index);
    });

    _controller.addListener(() {
      //print(_controller.offset);
      if (_controller.offset > 116) {
        //_offstage = true;
        setState(() {
          _offstage = false;
        });
      } else if (_controller.offset < 115) {
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
                                    32,
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
                              padding: EdgeInsets.only(top: 10, left: 16),
                              child: Container(
                                  height:
                                      (MediaQuery.of(context).size.width * 0.3 -
                                              32) /
                                          2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3 -
                                          32,
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
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Container(
                            height:
                                (MediaQuery.of(context).size.width * 0.3 - 32) *
                                        1.5 +
                                    10,
                            width: MediaQuery.of(context).size.width * 0.7 - 10,
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
              child: TabBar(
                  controller: tabController,
                  labelColor: ColorTheme.darkpale,
                  labelStyle: TextStyle(height: 0.5, fontSize: 14),
                  // labelStyle: TextStyle(
                  //   fontSize: 15.0,
                  // ),
                  unselectedLabelColor: ColorTheme.deactivatedText,
                  // unselectedLabelStyle: TextStyle(
                  //   fontSize: 12.0,
                  // ),
                  labelPadding: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                  indicator: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: ColorTheme.white, width: 1))),
                  tabs: <Widget>[
                    Tab(
                      icon: _selectedIndex == 0
                          ? Image.asset(
                              'assets/Icons/tab_1s.png',
                              width: 50,
                              height: 50,
                            )
                          : Image.asset(
                              'assets/Icons/tab_1.png',
                              width: 50,
                              height: 50,
                            ),
                      text: "Asset",
                    ),
                    Tab(
                      icon: _selectedIndex == 1
                          ? Image.asset(
                              'assets/Icons/tab_2s.png',
                              width: 50,
                              height: 50,
                            )
                          : Image.asset(
                              'assets/Icons/tab_2.png',
                              width: 50,
                              height: 50,
                            ),
                      text: "Invest",
                    ),
                    Tab(
                      icon: _selectedIndex == 2
                          ? Image.asset(
                              'assets/Icons/tab_3s.png',
                              width: 50,
                              height: 50,
                            )
                          : Image.asset(
                              'assets/Icons/tab_3.png',
                              width: 50,
                              height: 50,
                            ),
                      text: "Bill",
                    ),
                    Tab(
                      icon: _selectedIndex == 3
                          ? Image.asset(
                              'assets/Icons/tab_4s.png',
                              width: 50,
                              height: 50,
                            )
                          : Image.asset(
                              'assets/Icons/tab_4.png',
                              width: 50,
                              height: 50,
                            ),
                      text: "Detail",
                    )
                  ]),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                InvestPage(),
                InvestScreen(),
                Center(child: Text('Content of Profile')),
                Center(child: Text('Content of Profile')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;
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
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
