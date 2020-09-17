import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

import 'calendar_popup_view.dart';

class DateRowView extends StatefulWidget {
  const DateRowView(
      {Key key,
      this.initialStartDate,
      this.initialEndDate,
      this.onApplyClick,
      this.onCancelClick,
      this.barrierDismissible = true,
      this.isSingleDate = false,
      this.minimumDate,
      this.maximumDate})
      : super(key: key);

  final DateTime minimumDate;
  final DateTime maximumDate;
  final bool barrierDismissible;
  final bool isSingleDate;
  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final Function(DateTime, DateTime, DateTime, int) onApplyClick;

  final Function onCancelClick;
  @override
  _DateRowViewState createState() => _DateRowViewState();
}

class _DateRowViewState extends State<DateRowView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  DateTime startDate;
  DateTime endDate;
  String date = S.current.ChooseDate;
  String date1;
  bool timeMark = true;
  bool mark = true;
  bool dayBottom = false;
  bool weekBottom = false;
  bool monthBottom = true;
  bool yearBottom = false;

  int hour = 12;
  int minute = 30;
  int second = 30;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
            child: InkWell(
                onTap: () async {
                  showCalendar(context: context);
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              date,
                              style: dayBottom
                                  ? AppTheme.subPageTitle
                                  : AppTheme.noteTitle,
                            ),
                            date1 == null
                                ? Container()
                                : Text(
                                    date1,
                                    style: dayBottom
                                        ? AppTheme.subPageTitle
                                        : AppTheme.noteTitle,
                                  )
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        FaIcon(
                          FontAwesomeIcons.chevronDown,
                          size: 12,
                          color: dayBottom
                              ? ColorTheme.mainBlack
                              : ColorTheme.greylighter,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color:
                            dayBottom ? ColorTheme.mainGreen : ColorTheme.white,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    )
                  ],
                )),
            flex: 2),
        Expanded(
            child: InkWell(
                onTap: () {
                  if (!weekBottom) {
                    setState(() {
                      dayBottom = false;
                      weekBottom = true;
                      monthBottom = false;
                      yearBottom = false;
                      date = S.current.ChooseDate;
                    });
                  }
                },
                child: Column(
                  children: [
                    Text(
                      S.current.Week,
                      textAlign: TextAlign.center,
                      style: weekBottom
                          ? AppTheme.subPageTitle
                          : AppTheme.noteTitle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: weekBottom
                            ? ColorTheme.mainGreen
                            : ColorTheme.white,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    )
                  ],
                )),
            flex: 1),
        Expanded(
            child: InkWell(
                onTap: () {
                  if (!monthBottom) {
                    setState(() {
                      dayBottom = false;
                      weekBottom = false;
                      monthBottom = true;
                      yearBottom = false;
                      date = S.current.ChooseDate;
                      date1 = null;
                    });
                  }
                },
                child: Column(
                  children: [
                    Text(
                      S.current.Month,
                      textAlign: TextAlign.center,
                      style: monthBottom
                          ? AppTheme.subPageTitle
                          : AppTheme.noteTitle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: monthBottom
                            ? ColorTheme.mainGreen
                            : ColorTheme.white,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    )
                  ],
                )),
            flex: 1),
        Expanded(
            child: InkWell(
                onTap: () {
                  if (!yearBottom) {
                    setState(() {
                      dayBottom = false;
                      weekBottom = false;
                      monthBottom = false;
                      yearBottom = true;
                      date = S.current.ChooseDate;
                      date1 = null;
                    });
                  }
                },
                child: Column(
                  children: [
                    Text(
                      S.current.Year,
                      textAlign: TextAlign.center,
                      style: yearBottom
                          ? AppTheme.subPageTitle
                          : AppTheme.noteTitle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: yearBottom
                            ? ColorTheme.mainGreen
                            : ColorTheme.white,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    )
                  ],
                )),
            flex: 1),
      ],
    );
  }

  void showCalendar({BuildContext context}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        isSingleDate: false,
        //minimumDate: DateTime.now(),
        //maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        //initialEndDate: endDate,
        //initialStartDate: DateTime.now(),
        onApplyClick:
            (DateTime startData, DateTime endData, DateTime month, int mark) {
          widget.onApplyClick(startData, endData, month, mark);
        },
        onCancelClick: () {},
      ),
    );
  }
}
