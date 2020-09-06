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
                  style: AppTheme.subPageTitle),
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
            body: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.FirstName,
                          style: AppTheme.listTitle,
                        ),
                        Text(
                          person.firstname,
                          style: AppTheme.listTitle,
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
                              style: AppTheme.listTitle,
                            ),
                            Text(
                              person.midname,
                              style: AppTheme.listTitle,
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
                          style: AppTheme.listTitle,
                        ),
                        Text(
                          person.lastname,
                          style: AppTheme.listTitle,
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
                          style: AppTheme.listTitle,
                        ),
                        Text(
                          person.age.toString(),
                          style: AppTheme.listTitle,
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
                          style: AppTheme.listTitle,
                        ),
                        Text(
                          person.sex == 0 ? S.current.Famale : S.current.Male,
                          style: AppTheme.listTitle,
                        )
                      ],
                    )),
                OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0),
              ],
            )));
  }
}
