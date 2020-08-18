import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:io';
import 'home/home_page.dart';
import 'models/provider_data.dart';
import 'theme_ui/color_theme.dart';
import 'utils/db_helper.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  Map<String, dynamic> btc;
  Map<String, dynamic> eur;
  Map<String, dynamic> btcdaily;
  Map<String, dynamic> usdcnydaily;
  Map<String, dynamic> eurcnydaily;
  String etext = '';
  double progressValue = 0.0;

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
      etext = 'GET PERSONAL DATA ...';
      progressValue = 0.1;
    });
    await _doDatabase();
    setState(() {
      etext = 'GET BTC DATA ...';
      progressValue = 0.2;
    });
    // btc = await _getNetData(
    //     'https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=BTC&to_currency=USD&apikey=9AAGEESEANSVTYTV',
    //     1);
    eur = await _getNetData(
        'https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=EUR&to_currency=CNY&apikey=9AAGEESEANSVTYTV',
        5);
    var providerData = Provider.of<ProviderData>(context, listen: false);
    providerData.setEur(eur);
    setState(() {
      etext = 'GET BTC DAILY ...';
      progressValue = 0.4;
    });
    // btcdaily = await _getNetData(
    //     'https://www.alphavantage.co/query?function=DIGITAL_CURRENCY_DAILY&symbol=BTC&market=USD&apikey=9AAGEESEANSVTYTV',
    //     2);
    setState(() {
      etext = 'GET USD DAILY ...';
      progressValue = 0.6;
    });
    // usdcnydaily = await _getNetData(
    //     'https://www.alphavantage.co/query?function=FX_DAILY&from_symbol=USD&to_symbol=CNY&apikey=9AAGEESEANSVTYTV',
    //     3);
    setState(() {
      etext = 'GET EUR DAILY ...';
      progressValue = 0.8;
    });
    // eurcnydaily = await _getNetData(
    //     'https://www.alphavantage.co/query?function=FX_DAILY&from_symbol=EUR&to_symbol=CNY&apikey=9AAGEESEANSVTYTV',
    //     4);
    print("----get data done------");
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (context) => HomeScreen1(
            // btc: btc,
            // btcdaily: btcdaily,
            // usdcnydaily: usdcnydaily,
            // eurcnydaily: eurcnydaily,
            )));
  }

  _doDatabase() async {
    DBHelper dbHelper = DBHelper();
    await dbHelper.initDatabase();
    var providerData = Provider.of<ProviderData>(context, listen: false);
    providerData.getAssetList();
    providerData.getinvestList();
  }

  _getNetData(url, mark) async {
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        if (mark == 1) {
          return data['Realtime Currency Exchange Rate'];
        }
        if (mark == 2) {
          return data['Time Series (Digital Currency Daily)'];
        }
        if (mark == 3) {
          return data['Time Series FX (Daily)'];
        }
        if (mark == 4) {
          return data['Time Series FX (Daily)'];
        }
        if (mark == 5) {
          return data['Realtime Currency Exchange Rate'];
        }
      } else {
        print('Error getting data:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print('Failed getting data');
    }
    httpClient.close();
  }
}
