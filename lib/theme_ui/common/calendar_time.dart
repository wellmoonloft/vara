import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../color_theme.dart';

class CalendarTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> hour = List<int>.generate(24, (i) => i + 1);
    List<int> minute = List<int>.generate(60, (i) => i + 1);
    List<int> second = List<int>.generate(60, (i) => i + 1);
    return Positioned(
        left: 0,
        top: 80,
        child: Container(
            decoration: AppTheme.boxDecoration,
            child: Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width - 48) / 3,
                  height: 100,
                  child: ListView.separated(
                    itemCount: hour.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        hour[index].toString(),
                        textAlign: TextAlign.center,
                        style: AppTheme.listTitle,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: ColorTheme.background,
                        height: 2,
                      );
                    },
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 48) / 3,
                  height: 100,
                  child: ListView.separated(
                    itemCount: minute.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        minute[index].toString(),
                        textAlign: TextAlign.center,
                        style: AppTheme.listTitle,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: ColorTheme.background,
                        height: 2,
                      );
                    },
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 48) / 3,
                  height: 100,
                  child: ListView.separated(
                    itemCount: second.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        second[index].toString(),
                        textAlign: TextAlign.center,
                        style: AppTheme.listTitle,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: ColorTheme.background,
                        height: 2,
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}
