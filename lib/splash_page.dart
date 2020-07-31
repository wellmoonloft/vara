import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
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
      color: ColorTheme.white,
      child: Stack(alignment: AlignmentDirectional.center, children: <Widget>[
        Image(
          image: AssetImage('assets/Images/logo.png'),
          fit: BoxFit.fill,
        ),
      ]));
  Map<String, dynamic> btc;
  Map<String, dynamic> btcweek;

  @override
  void initState() {
    _navigatorAfterGetData();
    super.initState();
  }

  _navigatorAfterGetData() async {
    print("----等待获取数据------");
    DBHelper dbHelper = DBHelper();
    //1. init
    dbHelper.initDatabase();
    await _getBtcCurrency();
    await _getBtcWeekly();
    //await Future<dynamic>.delayed(const Duration(milliseconds: 5000));

    print("----数据获取完毕------");
    setState(() {
      tabBody = HomeView(btc: btc, btcweek: btcweek);
    });
  }

  _getBtcCurrency() async {
    var url =
        'https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=BTC&to_currency=USD&apikey=9AAGEESEANSVTYTV';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        btc = data['Realtime Currency Exchange Rate'];
      } else {
        print('Error getting data:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print('Failed getting data');
    }
    httpClient.close();
  }

  _getBtcWeekly() async {
    var url =
        'https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_DAILY&symbol=BTC&market=USD&apikey=9AAGEESEANSVTYTV';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      print('start');
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        btcweek = data['Time Series (Digital Currency Daily)'];
        //print(btcweek.length);
      } else {
        print('Error getting data:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print('Failed getting data');
    }
    httpClient.close();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return tabBody;
    });
  }
}
