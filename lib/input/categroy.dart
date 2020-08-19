import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class CategroyView extends StatefulWidget {
  const CategroyView({Key key}) : super(key: key);

  @override
  _CategroyViewState createState() => _CategroyViewState();
}

class _CategroyViewState extends State<CategroyView>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: ColorTheme.black.withOpacity(0.4),
      child: Scaffold(
          backgroundColor: ColorTheme.transparent,
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: ColorTheme.greydarker.withOpacity(0.7),
            elevation: 0,
            title: Text('Categories', style: AppTheme.buttomTitle),
            leading: IconButton(
                icon: Icon(Icons.close),
                iconSize: 20,
                color: ColorTheme.white,
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add_to_queue),
                iconSize: 20,
                color: ColorTheme.white,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => InvestImportView()));
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 20,
                color: ColorTheme.white,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => InvestImportView()));
                },
              ),
            ],
            bottom: new TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                new Tab(
                  text: 'Expenses',
                ),
                new Tab(
                  text: 'Income',
                ),
                new Tab(
                  text: 'Savings',
                ),
              ],
              controller: _tabController,
            ),
          ),
          body: Container(
            color: ColorTheme.greydarker.withOpacity(0.7),
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Expenses(),
                Container(child: new Text('船')),
                Container(child: new Text('巴士')),
              ],
            ),
          )),
    );
  }
}

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(children: [
              Text(
                'Miscellaneous',
                style: AppTheme.toptitleBigText,
              ),
              Icon(Icons.ac_unit)
            ])),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              color: ColorTheme.pantone,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
        ),
      ],
    );
  }
}
