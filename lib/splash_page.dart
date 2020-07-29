import 'package:flutter/material.dart';

import 'home/home_view.dart';
import 'utils/color_theme.dart';
import 'utils/db_helper.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  Widget tabBody = Container(
      color: ColorTheme.black,
      child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
        Image(
          image: AssetImage('assets/Images/logo.png'),
          fit: BoxFit.fill,
        ),
      ]));

  @override
  void initState() {
    _navigatorAfterGetData();
    super.initState();
  }

  _navigatorAfterGetData() async {
    print("----等待获取数据------");
    DBHelper dbHelper = DBHelper();
    //初始化数据库
    dbHelper.initDatabase();
    print("----数据获取完毕------");
    // Navigator.of(context).pushReplacement(
    //     new MaterialPageRoute(builder: (context) => new HomeView()));
    // Navigator.push(
    //   context,
    //   new MaterialPageRoute(builder: (BuildContext context) => new HomeView()),
    // );
    await Future<dynamic>.delayed(const Duration(milliseconds: 5000));
    setState(() {
      tabBody = HomeView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return tabBody;
    });
  }
}
