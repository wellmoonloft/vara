import 'package:flutter/material.dart';
import 'package:vara/home/file_picker_demo.dart';
import 'package:vara/invest/import/import_view.dart';

import 'app_theme.dart';
import 'color_theme.dart';
import 'toolkit.dart';

class SummaryBottom extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final Color color;
  final String subcolor;

  const SummaryBottom(
      {Key key,
      this.title,
      this.subtitle,
      this.value,
      this.color,
      this.subcolor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            letterSpacing: -0.2,
            color: ColorTheme.greydarker,
          ),
        ),
        subtitle == ''
            ? Padding(padding: const EdgeInsets.only(top: 4))
            : Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: ColorTheme.grey.withOpacity(0.5),
                  ),
                ),
              ),
        Padding(
          padding: const EdgeInsets.only(right: 0, top: 6),
          child: Container(
            height: 4,
            width: 70,
            decoration: BoxDecoration(
              color: HexColor(subcolor).withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: ((70 / 2.5)),
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      HexColor(subcolor),
                      HexColor(subcolor).withOpacity(0.1),
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class SummaryTopTitile extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const SummaryTopTitile({
    Key key,
    this.title,
    this.value,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 2),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: ColorTheme.greydarker,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 5),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: color,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SummaryTopGraph extends StatelessWidget {
  final String title;
  final num value;
  final Color color;
  final Color subcolor;

  const SummaryTopGraph(
      {Key key, this.title, this.value, this.color, this.subcolor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double temp = 0.0;
    if (value > 1) {
      temp = value / 100;
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
              border: new Border.all(width: 4, color: color.withOpacity(0.5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  formatNum(value, 2).toString() + '%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: color,
                  ),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 0.0,
                    color: ColorTheme.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomPaint(
            painter: CurvePainter(
                colors: [color, subcolor, subcolor], angle: (360 - 10) * temp),
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

class BeforeTitle extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const BeforeTitle({Key key, this.width, this.color, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final String title;
  final String navigator;
  final Color color;

  const CustomButtom({Key key, this.title, this.navigator, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppTheme.normalBorderRadius,
      ),
      child: Container(
          height: 40,
          width: 180,
          child: Padding(
              padding: EdgeInsets.all(8),
              child: InkWell(
                  onTap: () {
                    _navigateAndDisplaySelection(context, navigator);
                  },
                  child: Container(
                    alignment: Alignment(0, 0),
                    child: Text(
                      title,
                      style: AppTheme.buttomTitle,
                    ),
                  )))),
    );
  }
}

_navigateAndDisplaySelection(context, navigator) {
  if (navigator == 'invest') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InvestImportView()),
    );
  } else if (navigator == 'bill') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new FilePickerDemo()),
    );
  } else {}
}
