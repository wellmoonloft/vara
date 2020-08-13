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
            ),
            ImportBoxView(
              title: 'Invest',
              color: ColorTheme.cassis,
              navigator: '',
            ),
            ImportBoxView(
              title: 'Bill',
              color: ColorTheme.cantaloupe,
              navigator: '',
            ),
            //AssetChartView(),
          ],
        ));
  }
}
