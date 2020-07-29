import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vara/asset/currency.dart';
import 'package:vara/asset/overview.dart';
import 'package:vara/utils/title_view.dart';
import '../models/tab_icon_data.dart';
import 'bottom_bar_view.dart';
import '../utils/color_theme.dart';
import 'top_bar_view.dart';

class HomeView extends StatefulWidget {
  final Map<String, dynamic> btc;
  HomeView({Key key, this.btc}) : super(key: key);

  @override
  _StickyDemoState createState() => _StickyDemoState();
}

class _StickyDemoState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  ScrollController _controller = new ScrollController();
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  bool _offstage = true;
  Map<String, dynamic> btc;

  @override
  void initState() {
    super.initState();
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });

    //tabIconsList[0].isSelected = true;
    print(widget.btc);
    // print(btc['1. From_Currency Code']);
    // print(btc['3. To_Currency Code']);
    // print(btc['5. Exchange Rate']);
    // print(btc['6. Last Refreshed']);
    // print(btc['7. Time Zone']);
    _controller.addListener(() {
      //print(_controller.offset);
      //print(_controller.position.userScrollDirection.index);
      if (_controller.offset > 115 &&
          _controller.position.userScrollDirection.index == 2) {
        //_offstage = true;
        setState(() {
          _offstage = false;
        });
      }
      if (_controller.offset < 450 &&
          _controller.position.userScrollDirection.index == 1) {
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
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Text(
                            widget.btc['1. From_Currency Code'] +
                                '/' +
                                widget.btc['3. To_Currency Code'] +
                                ':' +
                                double.parse(widget.btc['5. Exchange Rate'])
                                    .toStringAsFixed(2) +
                                '  ' +
                                DateFormat('yyyy-MM-dd HH:MM')
                                    .format(DateTime.now()),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              letterSpacing: 0,
                              color: ColorTheme.nearlyBlack,
                            ),
                          ),
                        ])),
              ),
              background: Container(
                //color: Colors.grey,
                child: TopBarView(),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: bottomBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, int index) {
                Container postPiece;
                if (index == 0) {
                  postPiece = Container(
                    child: TitleView(
                      titleTxt: 'Summary',
                      //subTxt: 'Details',
                    ),
                  );
                } else if (index == 1) {
                  postPiece = Container(
                    child: OverviewView(),
                  );
                } else if (index == 2) {
                  postPiece = Container(
                    child: TitleView(
                      titleTxt: 'Charts',
                      //subTxt: 'Details',
                    ),
                  );
                } else if (index == 3) {
                  postPiece = Container(
                    child: CurrencyView(),
                  );
                } else if (index == 4) {
                  postPiece = Container(
                    child: TitleView(
                      titleTxt: 'Income',
                      //subTxt: 'Details',
                    ),
                  );
                } else if (index == 5) {
                  postPiece = Container(
                      height: 260,
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
                } else if (index == 6) {
                  postPiece = Container(
                    child: SizedBox(
                      height: 80,
                    ),
                  );
                }
                return postPiece;
              },
              childCount: 7,
            ),
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
                // Navigator.push(
                //   context,
                //   new MaterialPageRoute(
                //       builder: (context) => new CustomSliverHeaderDemo()),
                // );
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
