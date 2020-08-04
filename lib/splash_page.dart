import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'home/home_view.dart';
import 'utils/color_theme.dart';
import 'utils/db_helper.dart';

class SplashPage extends StatefulWidget {
  final String title;
  SplashPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  Map<String, dynamic> btc;
  Map<String, dynamic> btcdaily;
  Map<String, dynamic> usdcnydaily;
  Map<String, dynamic> eurcnydaily;
  List<Map> asset;
  static String _getText(String xx) {
    return xx;
  }

  Widget tabBody = Scaffold(
      body: Container(
          color: ColorTheme.white,
          child: Column(children: <Widget>[
            Image(
              image: AssetImage('assets/Images/logo.png'),
              fit: BoxFit.fill,
            ),
            Text(_getText('')),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
          ])));

  @override
  void initState() {
    _navigatorAfterGetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return tabBody;
    });
  }

  _navigatorAfterGetData() async {
    print("----get data start------");
    await _doDatabase();
    setState(() {
      _getText('44444444');
    });
    await _getBtcCurrency();
    await _getBTCWeekly();
    await _getUSDCNYWeekly();
    await _getEURCNYWeekly();
    print("----get data done------");
    setState(() {
      tabBody = HomeView(
          btc: btc,
          btcdaily: btcdaily,
          usdcnydaily: usdcnydaily,
          eurcnydaily: eurcnydaily,
          asset: asset);
    });
  }

  _doDatabase() async {
    DBHelper dbHelper = DBHelper();
    await dbHelper.initDatabase();
    asset = await dbHelper.getAsset();
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

  _getBTCWeekly() async {
    var url =
        'https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_DAILY&symbol=BTC&market=USD&apikey=9AAGEESEANSVTYTV';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      print('start btc');
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        btcdaily = data['Time Series (Digital Currency Daily)'];
      } else {
        print('Error getting data:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print('Failed getting data');
    }
    httpClient.close();
  }

  _getUSDCNYWeekly() async {
    var url =
        'https://www.alphavantage.co/query?function=FX_DAILY&from_symbol=USD&to_symbol=CNY&apikey=9AAGEESEANSVTYTV';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      print('start usd');
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        usdcnydaily = data['Time Series FX (Daily)'];
        print(usdcnydaily.length);
      } else {
        print('Error getting data:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print('Failed getting data');
    }
    httpClient.close();
  }

  _getEURCNYWeekly() async {
    var url =
        'https://www.alphavantage.co/query?function=FX_DAILY&from_symbol=EUR&to_symbol=CNY&apikey=9AAGEESEANSVTYTV';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      print('start eur');
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        eurcnydaily = data['Time Series FX (Daily)'];
        print(eurcnydaily.length);
      } else {
        print('Error getting data:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print('Failed getting data');
    }
    httpClient.close();
  }
}
