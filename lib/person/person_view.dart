import 'package:flutter/material.dart';
import 'package:vara/asset/asset_view.dart';
import 'package:vara/invest/invest_view.dart';
import 'package:vara/person/top_bar_view.dart';
import 'package:vara/utils/title_view.dart';
import '../utils/color_theme.dart';

class PersonView extends StatefulWidget {
  final Map<String, dynamic> btc;
  final Map<String, dynamic> btcdaily;
  final Map<String, dynamic> usdcnydaily;
  final Map<String, dynamic> eurcnydaily;
  PersonView({
    Key key,
    this.btc,
    this.btcdaily,
    this.usdcnydaily,
    this.eurcnydaily,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<PersonView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, int index) {
                Container postPiece;
                if (index == 0) {
                  postPiece = Container(
                    child: TopBarView(
                        btcdaily: widget.btcdaily,
                        usdcnydaily: widget.usdcnydaily,
                        eurcnydaily: widget.eurcnydaily),
                  );
                }
                if (index == 1) {
                  postPiece = Container(
                    child: TitleView(
                      titleTxt: 'Asset',
                      subTxt: '',
                      navigator: '',
                      color: ColorTheme.puristbluedarker,
                    ),
                  );
                } else if (index == 2) {
                  postPiece = Container(
                    child: AssetView(), //
                  );
                } else if (index == 3) {
                  postPiece = Container(
                    child: TitleView(
                      titleTxt: 'Invest',
                      subTxt: 'Invest List',
                      navigator: 'invest',
                      color: ColorTheme.cassis,
                    ), //
                  );
                } else if (index == 4) {
                  postPiece = Container(
                    child: InvestView(), //
                  );
                }
                return postPiece;
              },
              childCount: 5,
            ),
          ),
        ],
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.width * 0.2,
          padding: EdgeInsets.only(left: 16, right: 16, top: 30),
          child: FloatingActionButton(
              heroTag: "home",
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: ColorTheme.palelighter),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: MediaQuery.of(context).size.width * 0.22,
          padding: EdgeInsets.only(left: 16, right: 16, top: 30),
          child: FloatingActionButton(
              heroTag: "person",
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {},
              backgroundColor: ColorTheme.pale),
        )
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
