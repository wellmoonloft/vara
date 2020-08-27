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

class MineView extends StatefulWidget {
  const MineView({Key key}) : super(key: key);

  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  @override
  void initState() {
    super.initState();
  }

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
              title:
                  Text(S.current.AccountInformation, style: AppTheme.titleText),
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
                          style: AppTheme.titleTextSmallLighter,
                        ),
                        Text(
                          person.firstname,
                          style: AppTheme.titleTextSmallLighter,
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
                              style: AppTheme.titleTextSmallLighter,
                            ),
                            Text(
                              person.midname,
                              style: AppTheme.titleTextSmallLighter,
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
                          style: AppTheme.titleTextSmallLighter,
                        ),
                        Text(
                          person.lastname,
                          style: AppTheme.titleTextSmallLighter,
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
                          style: AppTheme.titleTextSmallLighter,
                        ),
                        Text(
                          person.age.toString(),
                          style: AppTheme.titleTextSmallLighter,
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
                          style: AppTheme.titleTextSmallLighter,
                        ),
                        Text(
                          person.sex == 0 ? S.current.Famale : S.current.Male,
                          style: AppTheme.titleTextSmallLighter,
                        )
                      ],
                    )),
                OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0),
              ],
            )));
  }
}
