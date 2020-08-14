import 'package:flutter/material.dart';
import 'package:vara/utils/color_theme.dart';

import 'import_box.dart';

class ImportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ImportBoxView(
              title: 'Asset',
              color: ColorTheme.puristblue,
              navigator: '',
              icon: Icons.import_export,
            ),
            ImportBoxView(
              title: 'Invest',
              color: ColorTheme.cassis,
              navigator: 'invest',
              icon: Icons.import_export,
            ),
            ImportBoxView(
              title: 'Bill',
              color: ColorTheme.cantaloupe,
              navigator: '',
              icon: Icons.import_export,
            ),
            //AssetChartView(),
          ],
        ));
  }
}

class BookkeepingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ImportBoxView(
              title: 'Asset',
              color: ColorTheme.puristblue,
              navigator: '',
              icon: Icons.add_circle,
            ),
            ImportBoxView(
              title: 'Invest',
              color: ColorTheme.cassis,
              navigator: '',
              icon: Icons.add_circle,
            ),
            ImportBoxView(
              title: 'Bill',
              color: ColorTheme.cantaloupe,
              navigator: '',
              icon: Icons.add_circle,
            ),
            //AssetChartView(),
          ],
        ));
  }
}
