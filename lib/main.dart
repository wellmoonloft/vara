import 'package:flutter/material.dart';
import 'home/home_view.dart';
import 'utils/db_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper dbHelper = DBHelper();
  //初始化数据库
  dbHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        //textTheme: TextTheme.lerp(a, b, t),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
    );
  }
}
