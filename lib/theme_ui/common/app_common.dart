import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/mine/settings/settings_view.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/transaction/transaction_list.dart';
import 'package:vara/utils/toolkit.dart';
import '../app_theme.dart';
import '../color_theme.dart';

class SummaryBottom extends StatelessWidget {
  final String title;
  final String subtitle;
  final double value;
  final String currency;

  const SummaryBottom(
      {Key key, this.title, this.subtitle, this.value, this.currency})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: AppTheme.listTitleWhite,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTheme.noteSubTitleWhite,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 10),
            child: NumbersText(
              value: value,
              style: AppTheme.inboxNumber,
              currency: currency,
            )),
      ],
    );
  }
}

class SummaryTopGraph extends StatelessWidget {
  final String title;
  final num value;
  final bool mark;

  const SummaryTopGraph({Key key, this.title, this.value, this.mark})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double temp = 0.0;

    if (mark) {
      temp = value * 100;
    } else {
      temp = value;
    }
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: ColorTheme.white,
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
              border: new Border.all(width: 4, color: ColorTheme.bgColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  temp.toStringAsFixed(2) + (mark ? '%' : ''),
                  textAlign: TextAlign.center,
                  style: AppTheme.subNumbers,
                ),
                Text(title,
                    textAlign: TextAlign.center, style: AppTheme.noteSubTitle),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomPaint(
            painter: CurvePainter(colors: [
              ColorTheme.mainGreen,
              ColorTheme.mainGreen.withOpacity(0.4)
            ], angle: (360 - 10) * value),
            child: SizedBox(
              width: 108,
              height: 108,
            ),
          ),
        )
      ],
    );
  }
}

class AppBarUI extends StatelessWidget {
  final String title;
  final String navigator;
  final AnimationController animationController;
  final Animation animation;
  final double opacity;
  final String settings;

  const AppBarUI(
      {Key key,
      this.title,
      this.navigator,
      this.animationController,
      this.animation,
      this.opacity,
      this.settings})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - animation.value), 0.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                title,
                                textAlign: TextAlign.left,
                                style: AppTheme.pageTitle,
                              ),
                            ),
                            settings == 'bill'
                                ? Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BillListView()),
                                          );
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.list,
                                          size: 16,
                                          color: ColorTheme.greytripledarker,
                                        )),
                                  )
                                : Container(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class SettingsAppBarUI extends StatelessWidget {
  final String title;
  final String navigator;
  final AnimationController animationController;
  final Animation animation;
  final double opacity;
  final String settings;

  const SettingsAppBarUI(
      {Key key,
      this.title,
      this.navigator,
      this.animationController,
      this.animation,
      this.opacity,
      this.settings})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - animation.value), 0.0),
                child: Container(
                  color: ColorTheme.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: AppTheme.outboxpadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return SettingsView();
                                    })).then((data) {
                                      if (data != null) {}
                                    });
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.cog,
                                    size: 20,
                                    color: ColorTheme.greyquadradarker,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Column(children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.width / 4,
                          width: MediaQuery.of(context).size.width / 4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Images/userImage.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                        ),
                        Consumer<ProviderData>(
                            builder: (context, providerdata, child) {
                          return Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                providerdata.person.firstname,
                                style: setNoteTitle(ColorTheme.greydarker),
                              ));
                        })
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class ListDetail extends StatelessWidget {
  final String title;
  final String value;

  const ListDetail({Key key, this.title, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                title,
                style: setNoteTitleLighter(ColorTheme.greydarker),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20, right: 20),
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: setNoteTitleLighter(ColorTheme.greydarker),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            color: ColorTheme.pantone,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
    ]);
  }
}

class OneHeightBorder extends StatelessWidget {
  final double top;
  final double left;
  final double right;
  final double bottom;

  const OneHeightBorder({Key key, this.top, this.left, this.right, this.bottom})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
      child: Container(
        height: 1,
        decoration: BoxDecoration(
          color: ColorTheme.pantone,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}

class NumbersText extends StatelessWidget {
  final double value;
  final TextStyle style;
  final String currency;

  const NumbersText({Key key, this.value, this.style, this.currency})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      value.abs() > AppTheme.maxNumber
          ? currency +
              ' ' +
              NumberFormat.compact(locale: Intl.getCurrentLocale())
                  .format(value)
          : NumberFormat(currency + " ###,##0.00", Intl.getCurrentLocale())
              .format(value),
      textAlign: TextAlign.start,
      style: style,
    );
  }
}
