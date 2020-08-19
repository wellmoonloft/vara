import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    List<IconData> _icons = [
      Icons.ac_unit,
      Icons.airport_shuttle,
      Icons.all_inclusive,
      Icons.beach_access,
      Icons.cake,
      Icons.free_breakfast
    ];
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Miscellaneous',
                    textAlign: TextAlign.left,
                    style: AppTheme.toptitleBigText,
                  ),
                  FaIcon(
                    FontAwesomeIcons.eyeSlash,
                    size: 16,
                    color: ColorTheme.white,
                  ),
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
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 1.2),
            itemCount: _icons.length,
            physics: new NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: ColorTheme.greylighter,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _icons[index],
                        color: ColorTheme.white,
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('data'),
                  )
                ],
              );
            })
      ],
    );
  }
}

class Income extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<IconData> _icons = [
      Icons.ac_unit,
      Icons.airport_shuttle,
      Icons.all_inclusive,
      Icons.beach_access,
      Icons.cake,
      Icons.free_breakfast
    ];
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(children: [
              Text(
                'Miscellaneous',
                textAlign: TextAlign.left,
                style: AppTheme.toptitleBigText,
              ),
              FaIcon(
                FontAwesomeIcons.eyeSlash,
                size: 20,
                color: ColorTheme.white,
              ),
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
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 1.0),
            itemCount: _icons.length,
            physics: new NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Icon(_icons[index]);
            })
      ],
    );
  }
}

class Savings extends StatelessWidget {
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
                textAlign: TextAlign.left,
                style: AppTheme.toptitleBigText,
              ),
              FaIcon(
                FontAwesomeIcons.eyeSlash,
                size: 20,
                color: ColorTheme.white,
              ),
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
