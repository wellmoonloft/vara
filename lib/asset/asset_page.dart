import 'package:flutter/material.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/title_view.dart';
import 'currency.dart';
import 'overview.dart';

class InvestPage extends StatefulWidget {
  const InvestPage({Key key}) : super(key: key);

  @override
  _InvestPageState createState() => _InvestPageState();
}

class _InvestPageState extends State<InvestPage> with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    addAllListData();
    super.initState();
  }

  void addAllListData() {
    listViews.add(
      TitleView(
        titleTxt: 'Asset Summary',
        //subTxt: 'Set accounts',
      ),
    );
    listViews.add(
      OverviewView(),
    );
    listViews.add(
      TitleView(
        titleTxt: 'Asset curve',
        //subTxt: 'more',
      ),
    );
    listViews.add(
      CurrencyView(),
    );

    // listViews.add(
    //   TitleView(
    //     titleTxt: 'Asset usage cycle',
    //     //subTxt: 'more',
    //   ),
    // );

    // listViews.add(
    //   OverviewView(),
    // );

    // listViews.add(
    //   SizedBox(
    //     height: 300,
    //   ),
    // );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
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
            physics: new NeverScrollableScrollPhysics(),
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height - 39,
              //bottom: AppBar().preferredSize.height + 500,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return listViews[index];
            },
          );
        }
      },
    );
  }
}
