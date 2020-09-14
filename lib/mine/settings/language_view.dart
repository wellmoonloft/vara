import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class LanguageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<LanguageData> languageList = <LanguageData>[
      LanguageData(
          flags: 'assets/flags/hongkong.png',
          languageName: '繁體中文',
          nation: 'Hong Kong'),
      LanguageData(
          flags: 'assets/flags/china.png',
          languageName: '简体中文',
          nation: 'China'),
      LanguageData(
          flags: 'assets/flags/uk.png',
          languageName: 'English',
          nation: 'United Kingdom'),
      LanguageData(
          flags: 'assets/flags/japan.png',
          languageName: '日本語',
          nation: 'Japan'),
      LanguageData(
          flags: 'assets/flags/estonia.png',
          languageName: 'Eestlane',
          nation: 'Estonia')
    ];
    return Container(
        child: Scaffold(
            backgroundColor: ColorTheme.white,
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: ColorTheme.white,
              elevation: 0,
              title: Text(S.current.Language, style: AppTheme.subPageTitle),
              leading: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.times,
                    size: 18,
                  ),
                  color: ColorTheme.greyquadradarker,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: ListView.separated(
              itemCount: languageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: AppTheme.inboxpadding,
                    child: InkWell(
                        onTap: () {
                          switch (index.toString()) {
                            case '0':
                              {
                                S.load(Locale('zh', 'HK'));
                              }
                              break;

                            case '1':
                              {
                                S.load(Locale('zh', 'CN'));
                              }
                              break;
                            case '2':
                              {
                                S.load(Locale('en', 'UK'));
                              }
                              break;
                            case '3':
                              {
                                S.load(Locale('ja', 'JP'));
                              }
                              break;
                            default:
                              {
                                S.load(Locale('et', 'EE'));
                              }
                              break;
                          }
                          Navigator.of(context).pop(index);
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    width: 40,
                                    height: 40,
                                    image:
                                        AssetImage(languageList[index].flags),
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    languageList[index].nation,
                                    textAlign: TextAlign.start,
                                    style: AppTheme.listTitle,
                                  ),
                                ],
                              ),
                              Text(
                                languageList[index].languageName,
                                textAlign: TextAlign.start,
                                style: AppTheme.listTitle,
                              ),
                              // FaIcon(
                              //   FontAwesomeIcons.check,
                              //   color: ColorTheme.grey,
                              //   size: 18,
                              // )
                            ])));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: ColorTheme.pantone,
                  height: 2,
                );
              },
            )));
  }
}

class LanguageData {
  String flags;
  String languageName;
  String nation;

  LanguageData({this.languageName, this.flags, this.nation});
}
