import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'utils/color_theme.dart';
import 'utils/db_helper.dart';

class SplashPage extends StatefulWidget {
  final editParentText;
  SplashPage({Key key, this.editParentText}) : super(key: key);

  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  Map<String, dynamic> btc;
  Map<String, dynamic> btcdaily;
  Map<String, dynamic> usdcnydaily;
  Map<String, dynamic> eurcnydaily;
  List<Map> asset;
  String etext = '';
  double progressValue = 0.0;
  List<Map> investList;
  //List investlist = await DBHelper().getInvest();

  @override
  void initState() {
    _navigatorAfterGetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorTheme.white,
        body: Container(
            padding: EdgeInsets.only(top: 50),
            // color: ColorTheme.white,
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Image(
                image: AssetImage('assets/Images/logo.png'),
                fit: BoxFit.fill,
              ),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: progressValue,
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(etext),
              )
            ])));
  }

  _navigatorAfterGetData() async {
    print("----get data start------");
    setState(() {
      etext = 'GET PERSONAL DATA FROM DATABASE ...';
      progressValue = 0.1;
    });
    await _doDatabase();
    setState(() {
      etext = 'GET BTC DATA FROM alphavantage.co ...';
      progressValue = 0.2;
    });
    btc = await _getBtcCurrency();
    setState(() {
      etext = 'GET BTC DAILY FROM alphavantage.co ...';
      progressValue = 0.4;
    });
    btcdaily = await _getBTCWeekly();
    setState(() {
      etext = 'GET USD DAILY FROM alphavantage.co ...';
      progressValue = 0.6;
    });
    usdcnydaily = await _getUSDCNYWeekly();
    setState(() {
      etext = 'GET EUR DAILY FROM alphavantage.co ...';
      progressValue = 0.8;
    });
    eurcnydaily = await _getEURCNYWeekly();
    print("----get data done------");
    widget.editParentText(
        false, btc, btcdaily, usdcnydaily, eurcnydaily, asset, investList);
  }

  _doDatabase() async {
    DBHelper dbHelper = DBHelper();
    await dbHelper.initDatabase();
    asset = await dbHelper.getAsset();
    investList = await DBHelper().getInvest();
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
        //btc = data['Realtime Currency Exchange Rate'];
        return data['Realtime Currency Exchange Rate'];
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
        //btcdaily = data['Time Series (Digital Currency Daily)'];
        return data['Time Series (Digital Currency Daily)'];
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
        //usdcnydaily = data['Time Series FX (Daily)'];
        return data['Time Series FX (Daily)'];
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
        //eurcnydaily = data['Time Series FX (Daily)'];
        return data['Time Series FX (Daily)'];
        //print(eurcnydaily.length);
      } else {
        print('Error getting data:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print('Failed getting data');
    }
    httpClient.close();
  }
}
