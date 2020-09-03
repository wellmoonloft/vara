import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';

class MineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Person person = Provider.of<ProviderData>(context).person;

    return Container(
        child: Scaffold(
            backgroundColor: ColorTheme.white,
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: ColorTheme.white,
              elevation: 0,
              title: Text(S.current.AccountInformation,
                  style: setHomeGraphNumnber(ColorTheme.greytripledarker)),
              leading: IconButton(
                  icon: FaIcon(FontAwesomeIcons.times),
                  color: ColorTheme.greyquadradarker,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.FirstName,
                          style: setNoteTitleLighter(ColorTheme.greydarker),
                        ),
                        Text(
                          person.firstname,
                          style: setNoteTitleLighter(ColorTheme.greydarker),
                        )
                      ],
                    )),
                person.midname == null
                    ? Container()
                    : OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0),
                person.midname == null
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.current.MidName,
                              style: setNoteTitleLighter(ColorTheme.greydarker),
                            ),
                            Text(
                              person.midname,
                              style: setNoteTitleLighter(ColorTheme.greydarker),
                            )
                          ],
                        )),
                OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.LastName,
                          style: setNoteTitleLighter(ColorTheme.greydarker),
                        ),
                        Text(
                          person.lastname,
                          style: setNoteTitleLighter(ColorTheme.greydarker),
                        )
                      ],
                    )),
                OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.Age,
                          style: setNoteTitleLighter(ColorTheme.greydarker),
                        ),
                        Text(
                          person.age.toString(),
                          style: setNoteTitleLighter(ColorTheme.greydarker),
                        )
                      ],
                    )),
                OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.Sex,
                          style: setNoteTitleLighter(ColorTheme.greydarker),
                        ),
                        Text(
                          person.sex == 0 ? S.current.Famale : S.current.Male,
                          style: setNoteTitleLighter(ColorTheme.greydarker),
                        )
                      ],
                    )),
                OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0),
              ],
            )));
  }
}
