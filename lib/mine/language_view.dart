import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import 'package:vara/utils/db_helper.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({Key key}) : super(key: key);

  @override
  _CurrencyViewState createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<LanguageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: ColorTheme.white,
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: ColorTheme.white,
            elevation: 0,
            title: Text('Language', style: AppTheme.titleText),
            leading: IconButton(
                icon: FaIcon(FontAwesomeIcons.times),
                color: ColorTheme.greyquadradarker,
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: <Widget>[
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.solidSave,
                  color: ColorTheme.neogreendarker,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: ListView(
            children: [
              OneHeightBorder(top: 10, left: 16, right: 16, bottom: 0),
              Padding(
                  padding: AppTheme.outboxpadding,
                  child: InkWell(
                      onTap: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '简体中文',
                              textAlign: TextAlign.start,
                              style: AppTheme.titleTextSmallLighter,
                            ),
                            FaIcon(
                              FontAwesomeIcons.check,
                              color: ColorTheme.grey,
                              size: 18,
                            )
                          ]))),
              OneHeightBorder(top: 5, left: 16, right: 16, bottom: 0),
              Padding(
                  padding: AppTheme.outboxpadding,
                  child: InkWell(
                      onTap: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '繁體中文',
                              textAlign: TextAlign.start,
                              style: AppTheme.titleTextSmallLighter,
                            ),
                            FaIcon(
                              FontAwesomeIcons.check,
                              color: ColorTheme.grey,
                              size: 18,
                            )
                          ]))),
              OneHeightBorder(top: 5, left: 16, right: 16, bottom: 0),
              Padding(
                  padding: AppTheme.outboxpadding,
                  child: InkWell(
                      onTap: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'English',
                              textAlign: TextAlign.start,
                              style: AppTheme.titleTextSmallLighter,
                            ),
                            FaIcon(
                              FontAwesomeIcons.check,
                              color: ColorTheme.grey,
                              size: 18,
                            )
                          ]))),
              OneHeightBorder(top: 5, left: 16, right: 16, bottom: 0),
              Padding(
                  padding: AppTheme.outboxpadding,
                  child: InkWell(
                      onTap: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '日本語',
                              textAlign: TextAlign.start,
                              style: AppTheme.titleTextSmallLighter,
                            ),
                            FaIcon(
                              FontAwesomeIcons.check,
                              color: ColorTheme.grey,
                              size: 18,
                            )
                          ]))),
              OneHeightBorder(top: 5, left: 16, right: 16, bottom: 0),
              Padding(
                  padding: AppTheme.outboxpadding,
                  child: InkWell(
                      onTap: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Eestlane',
                              textAlign: TextAlign.start,
                              style: AppTheme.titleTextSmallLighter,
                            ),
                            FaIcon(
                              FontAwesomeIcons.check,
                              color: ColorTheme.grey,
                              size: 18,
                            )
                          ]))),
              OneHeightBorder(top: 5, left: 16, right: 16, bottom: 10),
            ],
          )),
    );
  }
}
