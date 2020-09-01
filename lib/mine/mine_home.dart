import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import 'settings_view.dart';

class MineHome extends StatefulWidget {
  final AnimationController animationController;

  const MineHome({Key key, this.animationController}) : super(key: key);
  @override
  _MineHomeState createState() => _MineHomeState();
}

class _MineHomeState extends State<MineHome> with TickerProviderStateMixin {
  List<Widget> listViews = <Widget>[];

  @override
  void initState() {
    addAllListData();
    super.initState();
  }

  void addAllListData() {
    const int count = 5;

    listViews.add(Container(child: Text('dddd')));

    listViews.add(
      AppBarUI(
        title: S.current.Asset,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: CustomScrollView(
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
                      if (data != null) {}
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
            getMainListViewUI()
          ],
        ));
  }

  Widget getMainListViewUI() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) => listViews[index],
      childCount: listViews.length,
    ));
  }
}
