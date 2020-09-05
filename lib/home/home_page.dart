import 'package:flutter/material.dart';
import 'package:vara/asset/asset_home.dart';
import 'package:vara/invest/invest_home.dart';
import 'package:vara/mine/mine_home.dart';
import 'package:vara/models/default_data.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/bottom_bar_view.dart';
import 'package:vara/transaction/transaction_home.dart';

class HomeScreen extends StatefulWidget {
  final String tabBodyView;

  const HomeScreen({Key key, this.tabBodyView}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: ColorTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = AssetHome(animationController: animationController);
    super.initState();
    if (widget.tabBodyView == 'MineHome') {
      tabIconsList[0].isSelected = false;
      tabIconsList[3].isSelected = true;
      setState(() {
        tabBody = MineHome(animationController: animationController);
      });
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: Stack(
        children: <Widget>[
          tabBody,
          bottomBar(),
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
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = AssetHome(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      InvestHome(animationController: animationController);
                });
              });
            } else if (index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = BillHome(animationController: animationController);
                });
              });
            } else if (index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = MineHome(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
