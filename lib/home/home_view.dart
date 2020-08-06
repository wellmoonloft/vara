import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vara/asset/asset_title_view.dart';
import 'package:vara/asset/asset_view.dart';
import 'package:vara/bill/bill_title_view.dart';
import 'package:vara/bill/bill_view.dart';
import 'package:vara/invest/invest_title_view.dart';
import 'package:vara/invest/invest_view.dart';
import '../models/tab_icon_data.dart';
import '../utils/color_theme.dart';
import 'file_picker_demo.dart';
import 'top/top_bar_view.dart';
import '../bill/import.dart';
import 'bottom_bar_view.dart';

class HomeView extends StatefulWidget {
  final Map<String, dynamic> btc;
  final Map<String, dynamic> btcdaily;
  final Map<String, dynamic> usdcnydaily;
  final Map<String, dynamic> eurcnydaily;
  final List<Map> asset;
  final List<Map> investList;
  HomeView(
      {Key key,
      this.btc,
      this.btcdaily,
      this.usdcnydaily,
      this.eurcnydaily,
      this.asset,
      this.investList})
      : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  ScrollController _controller = new ScrollController();
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  bool _offstage = true;
  Map<String, dynamic> btc;
  String bannertitle;

  @override
  void initState() {
    super.initState();
    String from = '';
    String to = '';
    String rate = '0.0';
    if (widget.btc != null) {
      if (widget.btc['1. From_Currency Code'] != null) {
        from = widget.btc['1. From_Currency Code'];
      }
      if (widget.btc['3. To_Currency Code'] != null) {
        from = widget.btc['3. To_Currency Code'];
      }
      if (widget.btc['5. Exchange Rate'] != null) {
        rate = widget.btc['5. Exchange Rate'];
      }
    }
    bannertitle = from +
        '/' +
        to +
        ':' +
        double.parse(rate).toStringAsFixed(2) +
        '  ' +
        DateFormat('yyyy-MM-dd HH:MM').format(DateTime.now());
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });

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
      if (_controller.offset < 400 &&
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
            backgroundColor: ColorTheme.background,
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
                      color: ColorTheme.palelighter,
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
                            bannertitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              letterSpacing: 0,
                              color: ColorTheme.white,
                            ),
                          ),
                        ])),
              ),
              background: Container(
                //color: Colors.grey,
                child: TopBarView(
                    btcdaily: widget.btcdaily,
                    usdcnydaily: widget.usdcnydaily,
                    eurcnydaily: widget.eurcnydaily),
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
                    child: AssetTitleView(
                      titleTxt: 'Asset',
                    ),
                  );
                } else if (index == 1) {
                  postPiece = Container(
                    child: AssetView(asset: widget.asset),
                  );
                } else if (index == 2) {
                  postPiece = Container(
                    child: InvestTitleView(
                        titleTxt: 'Invest',
                        subTxt: 'Details',
                        investList: widget.investList),
                  );
                } else if (index == 3) {
                  postPiece = Container(
                    child: InvestView(investList: widget.investList),
                  );
                } else if (index == 4) {
                  postPiece = Container(
                    child: BillTitleView(
                      titleTxt: 'Bill',
                      subTxt: 'Details',
                    ),
                  );
                } else if (index == 5) {
                  postPiece = Container(
                    child: BillView(billList: widget.asset),
                  );
                } else if (index == 6) {
                  postPiece = Container(
                    child: SizedBox(
                      height: 65,
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

  _navigateAndDisplaySelection(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImportView()),
    );

    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
  }

  _navigateAndDisplaySelection1(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilePickerDemo()),
    );

    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
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
              setState(() {});
            } else if (index == 1) {
              setState(() {});
            } else if (index == 2) {
              _navigateAndDisplaySelection1(context);
            } else if (index == 3) {
              _navigateAndDisplaySelection(context);
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
      color: ColorTheme.background,
      child: this.child,
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
