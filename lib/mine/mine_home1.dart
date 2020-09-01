import 'package:flutter/material.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/transaction/chart_title.dart';
import 'package:vara/transaction/transaction_summary.dart';

class MineHome extends StatefulWidget {
  const MineHome({Key key, this.animationController}) : super(key: key);
  final AnimationController animationController;
  @override
  _MineHomeState createState() => _MineHomeState();
}

class _MineHomeState extends State<MineHome> with TickerProviderStateMixin {
  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    addAllListData();
  }

  void addAllListData() {
    const int count = 5;
    listViews.add(
      SettingsAppBarUI(
        title: S.current.Transaction,
        settings: 'settings',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      BillSummaryView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      ChartTitle(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.white,
      child: Scaffold(
        backgroundColor: Colors.white,
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
    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.only(
        top: 0,
        bottom: 92 + MediaQuery.of(context).padding.bottom,
      ),
      itemCount: listViews.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        widget.animationController.forward();
        return listViews[index];
      },
    );
  }
}
