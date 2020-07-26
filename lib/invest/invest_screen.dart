import 'package:flutter/material.dart';
import 'package:vara/asset/currency.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/title_view.dart';
import 'suggest_view.dart';
import 'summary_view.dart';

class InvestScreen extends StatefulWidget {
  const InvestScreen({Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _InvestScreenState createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    listViews.add(
      SuggestView(),
    );
    listViews.add(
      TitleView(
        titleTxt: 'Income',
        //subTxt: 'Details',
      ),
    );
    // listViews.add(
    //   SummaryView(),
    // );

    listViews.add(
      SummaryView(),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Investment appraisal',
        //subTxt: 'Customize',
      ),
    );

    listViews.add(
      CurrencyView(),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 45),
      color: ColorTheme.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height,
              //bottom: AppBar().preferredSize.height + 500,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              //widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }
}
