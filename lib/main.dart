import 'package:flutter/material.dart';
import 'home/home_view.dart';
import 'splash_page.dart';
import 'utils/color_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _pages = true;
  Map<String, dynamic> _btc;
  Map<String, dynamic> _btcdaily;
  Map<String, dynamic> _usdcnydaily;
  Map<String, dynamic> _eurcnydaily;
  List<Map> _asset;
  List<Map> _investList;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ColorTheme.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _pages
          ? SplashPage(
              editParentText: (editText, btc, btcdaily, usdcnydaily,
                  eurcnydaily, asset, investList) {
                _editParentText(editText, btc, btcdaily, usdcnydaily,
                    eurcnydaily, asset, investList);
              },
            )
          : HomeView(
              btc: _btc,
              btcdaily: _btcdaily,
              usdcnydaily: _usdcnydaily,
              eurcnydaily: _eurcnydaily,
              asset: _asset,
              investList: _investList),
    );
  }

  _editParentText(
      editText, btc, btcdaily, usdcnydaily, eurcnydaily, asset, investList) {
    _btc = btc;
    _btcdaily = btcdaily;
    _usdcnydaily = usdcnydaily;
    _eurcnydaily = eurcnydaily;
    _asset = asset;
    _investList = investList;
    setState(() {
      _pages = editText;
    });
  }
}
