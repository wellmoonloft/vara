import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vara/asset/asset_view.dart';
import 'package:vara/bill/bill_view.dart';
import 'package:vara/invest/invest_view.dart';
import 'package:vara/person/person_view.dart';
import 'package:vara/utils/title_view.dart';

import '../utils/color_theme.dart';
import '../utils/app_theme.dart';
import 'top/top_bar_view.dart';

class HomeView extends StatefulWidget {
  final Map<String, dynamic> btc;
  final Map<String, dynamic> btcdaily;
  final Map<String, dynamic> usdcnydaily;
  final Map<String, dynamic> eurcnydaily;
  HomeView({
    Key key,
    this.btc,
    this.btcdaily,
    this.usdcnydaily,
    this.eurcnydaily,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  ScrollController _controller = new ScrollController();

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
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      //print(_controller.offset);
      //print(_controller.position.userScrollDirection.index);
      if (_controller.offset > 115 &&
          _controller.position.userScrollDirection.index == 2) {
        setState(() {
          _offstage = false;
        });
      }
      if (_controller.offset < 400 &&
          _controller.position.userScrollDirection.index == 1) {
        setState(() {
          _offstage = true;
        });
      }
    });
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
                    height: 40,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: AppTheme.boxDecoration,
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Text(
                            bannertitle,
                            textAlign: TextAlign.center,
                            style: AppTheme.titleTextSmallLighter,
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
          // SliverPersistentHeader(
          //   pinned: true,
          //   delegate: StickyTabBarDelegate(
          //     child: bottomBar(),
          //   ),
          // ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, int index) {
                Container postPiece;
                if (index == 0) {
                  postPiece = Container(
                    child: TitleView(
                      titleTxt: 'Asset',
                      subTxt: '',
                      navigator: '',
                      color: ColorTheme.puristbluedarker,
                    ),
                    //AssetTitleView(titleTxt: 'Asset'),
                  );
                } else if (index == 1) {
                  postPiece = Container(
                    child: AssetView(), //
                  );
                } else if (index == 2) {
                  postPiece = Container(
                    child: TitleView(
                      titleTxt: 'Invest',
                      subTxt: 'Invest List',
                      navigator: 'invest',
                      color: ColorTheme.cassis,
                    ), //
                  );
                } else if (index == 3) {
                  postPiece = Container(
                    child: InvestView(), //
                  );
                } else if (index == 4) {
                  postPiece = Container(
                    child: TitleView(
                      titleTxt: 'Bill',
                      subTxt: 'Bill List',
                      navigator: 'bill',
                      color: ColorTheme.cantaloupe,
                    ),
                  );
                } else if (index == 5) {
                  postPiece = Container(
                    child: BillView(), //
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
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: MediaQuery.of(context).size.width * 0.22,
          padding: EdgeInsets.only(left: 16, right: 16, top: 30),
          child: FloatingActionButton(
              heroTag: "home",
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {},
              backgroundColor: ColorTheme.pale),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
          padding: EdgeInsets.only(left: 16, right: 16, top: 30),
          child: FloatingActionButton(
              heroTag: "person",
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PersonView()));
              },
              backgroundColor: ColorTheme.palelighter),
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
