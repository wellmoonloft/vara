import 'package:flutter/material.dart';
import 'package:vara/utils/app_theme.dart';
import 'package:vara/utils/color_theme.dart';

class RightPart extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry padding;

  const RightPart({Key key, this.title, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: titleTextSmall,
      ),
    );
  }
}

class MidPart extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const MidPart({Key key, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        '=>',
        textAlign: TextAlign.center,
        style: TextStyle(
          //fontFamily: AppTheme.fontName,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: ColorTheme.puristbluedarker,
        ),
      ),
    );
  }
}

class MappingLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RightPart(
          title: 'Invest Code',
          padding: EdgeInsets.only(top: 15),
        ),
        RightPart(
          title: 'Invest Amount',
          padding: EdgeInsets.only(top: 29),
        ),
        RightPart(
          title: 'Invest Time',
          padding: EdgeInsets.only(top: 29),
        ),
        RightPart(
          title: 'Per Time',
          padding: EdgeInsets.only(top: 29),
        ),
        RightPart(
          title: 'Payment Time',
          padding: EdgeInsets.only(top: 29),
        ),
        RightPart(
          title: 'Received',
          padding: EdgeInsets.only(top: 29),
        ),
        RightPart(
          title: 'Invest Type',
          padding: EdgeInsets.only(top: 29),
        ),
        RightPart(
          title: 'Status',
          padding: EdgeInsets.only(top: 29),
        ),
        RightPart(
          title: 'Currency',
          padding: EdgeInsets.only(top: 29),
        ),
        RightPart(
          title: 'Country',
          padding: EdgeInsets.only(top: 29),
        ),
      ],
    );
  }
}

class MappingMid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MidPart(padding: EdgeInsets.only(top: 15)),
        MidPart(padding: EdgeInsets.only(top: 29)),
        MidPart(padding: EdgeInsets.only(top: 29)),
        MidPart(padding: EdgeInsets.only(top: 29)),
        MidPart(padding: EdgeInsets.only(top: 29)),
        MidPart(padding: EdgeInsets.only(top: 29)),
        MidPart(padding: EdgeInsets.only(top: 29)),
        MidPart(padding: EdgeInsets.only(top: 29)),
        MidPart(padding: EdgeInsets.only(top: 29)),
        MidPart(padding: EdgeInsets.only(top: 29))
      ],
    );
  }
}
