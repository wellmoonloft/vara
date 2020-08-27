import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'dart:convert';
import 'dart:io';
import 'home_page.dart';
import '../models/db_models.dart';
import '../models/provider_data.dart';
import '../theme_ui/color_theme.dart';
import '../utils/db_helper.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  Map<String, dynamic> btc;
  Map<String, dynamic> currency;
  String currencyTilte = 'EUR';
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
            //padding: EdgeInsets.only(top: 50),
            // color: ColorTheme.white,
            alignment: Alignment.center,
            child: Container(
                child: Image(
              image: AssetImage('assets/Images/logo.png'),
              fit: BoxFit.fill,
            ))));
  }

  _navigatorAfterGetData() async {
    print("----get data start------");
    await _doDatabase();

    currency = await _getNetData('https://api.ratesapi.io/api/latest');
    var providerData = Provider.of<ProviderData>(context, listen: false);
    providerData.setCurrencyData(currency, currencyTilte);

    print("----get data done------");
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  _doDatabase() async {
    DBHelper dbHelper = DBHelper();
    var providerData = Provider.of<ProviderData>(context, listen: false);
    await providerData.getAssetList();
    await providerData.getinvestList();
    await providerData.getBillList();
    await providerData.getPerson();
    Settings settings = await dbHelper.getSettings();
    currencyTilte = settings.currency;
    String language = settings.language;

    switch (language) {
      case 'CN':
        {
          S.load(Locale('zh', 'CN'));
        }
        break;

      case 'HK':
        {
          S.load(Locale('zh', 'HK'));
        }
        break;
      case 'JP':
        {
          S.load(Locale('ja', 'JP'));
        }
        break;
      case 'EE':
        {
          S.load(Locale('et', 'EE'));
        }
        break;
      default:
        {
          S.load(Locale('en'));
        }
        break;
    }
  }

  _getNetData(url) async {
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        return data['rates'];
      } else {
        print('Error getting data:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      print('Failed getting data');
    }
    httpClient.close();
  }
}
