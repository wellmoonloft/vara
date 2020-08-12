import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/provider_data.dart';
import 'splash_page.dart';
import 'utils/color_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => InvestData(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: ColorTheme.background,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SplashPage()));
  }
}
