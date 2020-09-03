import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class LanguageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> language = ['繁體中文', '简体中文', 'English', '日本語', 'Eestlane'];
    return Container(
        child: Scaffold(
            backgroundColor: ColorTheme.white,
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: ColorTheme.white,
              elevation: 0,
              title: Text(S.current.Language,
                  style: setHomeGraphNumnber(ColorTheme.greytripledarker)),
              leading: IconButton(
                  icon: FaIcon(FontAwesomeIcons.times),
                  color: ColorTheme.greyquadradarker,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: ListView.separated(
              itemCount: language.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: AppTheme.outboxpadding,
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
                                S.load(Locale('en'));
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
                              Text(
                                language[index],
                                textAlign: TextAlign.start,
                                style:
                                    setNoteTitleLighter(ColorTheme.greydarker),
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
