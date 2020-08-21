import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vara/models/tabIcon_data.dart';
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
                icon: FaIcon(FontAwesomeIcons.times),
                color: ColorTheme.white,
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: <Widget>[
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.edit,
                  size: 20,
                ),
                color: ColorTheme.white,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => InvestImportView()));
                },
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 20,
                ),
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
                Income(),
                Savings(),
              ],
            ),
          )),
    );
  }
}

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CategroyData> miscellaneousData = CategroyData.miscellaneousData;
    List<CategroyData> entertainmentData = CategroyData.entertainmentData;
    List<CategroyData> foodData = CategroyData.foodData;
    List<CategroyData> housingData = CategroyData.housingData;
    List<CategroyData> lifestyleData = CategroyData.lifestyleData;
    List<CategroyData> transportationData = CategroyData.transportationData;
    return ListView(padding: const EdgeInsets.only(top: 20.0), children: [
      GridTitle(
        icons: miscellaneousData.last.iconList,
        title: miscellaneousData.last.categroyTitle,
        color: miscellaneousData.last.color,
        mark: 0,
      ),
      GridTitle(
        icons: entertainmentData.last.iconList,
        title: entertainmentData.last.categroyTitle,
        color: entertainmentData.last.color,
        mark: 0,
      ),
      GridTitle(
        icons: foodData.last.iconList,
        title: foodData.last.categroyTitle,
        color: foodData.last.color,
        mark: 0,
      ),
      GridTitle(
        icons: housingData.last.iconList,
        title: housingData.last.categroyTitle,
        color: housingData.last.color,
        mark: 0,
      ),
      GridTitle(
        icons: lifestyleData.last.iconList,
        title: lifestyleData.last.categroyTitle,
        color: lifestyleData.last.color,
        mark: 0,
      ),
      GridTitle(
        icons: transportationData.last.iconList,
        title: transportationData.last.categroyTitle,
        color: transportationData.last.color,
        mark: 0,
      )
    ]);
  }
}

class Income extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CategroyData> incomeData = CategroyData.incomeData;
    return ListView(padding: const EdgeInsets.only(top: 20.0), children: [
      GridTitle(
        icons: incomeData.last.iconList,
        title: incomeData.last.categroyTitle,
        color: incomeData.last.color,
        mark: 1,
      )
    ]);
  }
}

class Savings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CategroyData> savingsData = CategroyData.savingsData;
    return ListView(padding: const EdgeInsets.only(top: 20.0), children: [
      GridTitle(
        icons: savingsData.last.iconList,
        title: savingsData.last.categroyTitle,
        color: savingsData.last.color,
        mark: 1,
      )
    ]);
  }
}

class GridTitle extends StatefulWidget {
  final List<CategroyIcon> icons;
  final String title;
  final Color color;
  final int mark;
  GridTitle({this.icons, this.title, this.color, this.mark});

  _GridTitleState createState() => _GridTitleState();
}

class _GridTitleState extends State<GridTitle> {
  bool mark = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.left,
                    style: AppTheme.buttomTitle,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        mark = !mark;
                      });
                    },
                    child: FaIcon(
                      mark ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                      size: 16,
                      color: ColorTheme.white,
                    ),
                  )
                ])),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 20),
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              color: ColorTheme.pantone,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
        ),
        mark
            ? IconGridView(
                icons: widget.icons,
                color: widget.color,
                title: widget.title,
                mark: widget.mark,
              )
            : Container()
      ],
    );
  }
}

class IconGridView extends StatelessWidget {
  final List<CategroyIcon> icons;
  final String title;
  final Color color;
  final int mark;

  IconGridView({this.icons, this.color, this.title, this.mark});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1.0),
        itemCount: icons.length,
        physics: new NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  //print(icons[index].title);
                  //var data = Map();
                  var data = {
                    'title': icons[index].title,
                    'color': color,
                    'icon': icons[index].icon,
                    'categroy': title,
                    'mark': mark
                  };
                  Navigator.of(context).pop(data);
                },
                child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: FaIcon(
                      icons[index].icon,
                      color: ColorTheme.white,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  icons[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: ColorTheme.white,
                  ),
                ),
              )
            ],
          );
        });
  }
}
