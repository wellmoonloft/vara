import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

import 'settings_view.dart';
import 'import_view.dart';

class MineHome extends StatelessWidget {
  final AnimationController animationController;

  const MineHome({Key key, this.animationController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          brightness: Brightness.light,
          leading: IconButton(
              icon: FaIcon(FontAwesomeIcons.cog),
              iconSize: 20,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SettingsView();
                })).then((data) {
                  if (data != null) {
                    // setState(() {
                    //   categroyTitle = data['title'];
                    //   categroyColor = data['color'];
                    //   categroyIcon = data['icon'];
                    //   categroy = data['categroy'];
                    //   mark = data['mark'];
                    // });
                  }
                });
              }),
          backgroundColor: ColorTheme.puristbluedarker,
          expandedHeight: 200.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: Text(''),
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
                height: 80,
                width: 200,
                child: Column(children: <Widget>[
                  Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorTheme.white,
                        shape: BoxShape.circle,
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.userAlt,
                        color: ColorTheme.grey,
                      )),
                  Consumer<ProviderData>(
                      builder: (context, providerdata, child) {
                    return Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          providerdata.person.firstname,
                          style: AppTheme.toptitleText,
                        ));
                  })
                ])),
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [ColorTheme.cantaloupe, ColorTheme.cassis],
                ),
              ),
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 250.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              child: ImportView(),
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
