import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

import 'dart:math';
import 'custom_calendar.dart';

class CalendarPopupView extends StatefulWidget {
  const CalendarPopupView(
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
  _CalendarPopupViewState createState() => _CalendarPopupViewState();
}

class _CalendarPopupViewState extends State<CalendarPopupView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  DateTime startDate;
  DateTime endDate;
  String month = DateFormat('yyyy-MM').format(DateTime.now());
  bool timeMark = true;
  double _hourValue = 12;
  double _minuteValue = 30;
  double _secondValue = 30;

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
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: animationController.value,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (widget.barrierDismissible) {
                    Navigator.pop(context);
                  }
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      height: MediaQuery.of(context).size.width + 150,
                      decoration: BoxDecoration(
                        color: ColorTheme.background,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(4, 4),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
                          onTap: () {},
                          child: Stack(overflow: Overflow.visible, children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            widget.isSingleDate
                                                ? S.current.Date
                                                : 'From',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: 16,
                                                color: Colors.grey
                                                    .withOpacity(0.8)),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            startDate != null
                                                ? DateFormat('EEE, dd MMM')
                                                    .format(startDate)
                                                : month,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 74,
                                      // width: 0,
                                      // color: ColorTheme.grey,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          if (widget.isSingleDate) {
                                            setState(() {
                                              timeMark = !timeMark;
                                            });
                                          }
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              widget.isSingleDate
                                                  ? 'Time'
                                                  : 'To',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 16,
                                                  color: Colors.grey
                                                      .withOpacity(0.8)),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  widget.isSingleDate
                                                      ? (hour < 10
                                                              ? '0' +
                                                                  hour
                                                                      .toString()
                                                              : hour
                                                                  .toString()) +
                                                          ':' +
                                                          minute.toString() +
                                                          ':' +
                                                          second.toString()
                                                      : (endDate != null
                                                          ? DateFormat(
                                                                  'EEE, dd MMM')
                                                              .format(endDate)
                                                          : month),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing:
                                                          widget.isSingleDate
                                                              ? 1.3
                                                              : 0,
                                                      fontSize: 16),
                                                ),
                                                widget.isSingleDate
                                                    ? SizedBox(
                                                        width: 5,
                                                      )
                                                    : Container(),
                                                widget.isSingleDate
                                                    ? FaIcon(
                                                        FontAwesomeIcons
                                                            .chevronDown,
                                                        size: 12,
                                                        color: ColorTheme
                                                            .mainBlack,
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(
                                  height: 1,
                                ),
                                CustomCalendarView(
                                    minimumDate: widget.minimumDate,
                                    maximumDate: widget.maximumDate,
                                    initialEndDate: widget.initialEndDate,
                                    initialStartDate: widget.initialStartDate,
                                    isSingleDate: widget.isSingleDate,
                                    startEndDateChange: (DateTime startDateData,
                                        DateTime endDateData) {
                                      setState(() {
                                        startDate = startDateData;
                                        endDate = endDateData;
                                      });
                                    },
                                    monthConfirm: (DateTime _month) {
                                      widget.onApplyClick(
                                          null, null, _month, 0);
                                      Navigator.pop(context);
                                    }),
                                Padding(
                                    padding: const EdgeInsets.all(28),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              S.current.Cancel,
                                              textAlign: TextAlign.end,
                                              style: AppTheme.listTitle,
                                            )),
                                        SizedBox(
                                          width: 28,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              try {
                                                // animationController.reverse().then((f) {

                                                // });
                                                if (endDate == null) {
                                                  widget.onApplyClick(
                                                      startDate, null, null, 1);
                                                } else {
                                                  widget.onApplyClick(startDate,
                                                      endDate, null, 2);
                                                }

                                                Navigator.pop(context);
                                              } catch (_) {}
                                            },
                                            child: Text(
                                              S.current.Confirm,
                                              textAlign: TextAlign.end,
                                              style: AppTheme.listTitle,
                                            )),
                                      ],
                                    )),
                              ],
                            ),
                            timeMark
                                ? Container()
                                : Positioned(
                                    right: 3,
                                    top: 60,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      transform: Matrix4.rotationZ(pi / 4),
                                      decoration: BoxDecoration(
                                        color: ColorTheme.mainBlack,
                                      ),
                                    ),
                                  ),
                            timeMark
                                ? Container()
                                : Positioned(
                                    right: 16,
                                    top: 80,
                                    child: Container(
                                        padding: AppTheme.inboxpadding,
                                        decoration: BoxDecoration(
                                          color: ColorTheme.mainBlack,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Slider(
                                              min: 0,
                                              max: 24,
                                              activeColor: ColorTheme.mainGreen,
                                              inactiveColor: ColorTheme.grey,
                                              value: _hourValue,
                                              onChanged: (v) {
                                                setState(() {
                                                  _hourValue = v;
                                                  hour = v.toInt();
                                                });
                                              },
                                            ),
                                            Slider(
                                              min: 0,
                                              max: 60,
                                              activeColor: ColorTheme.mainGreen,
                                              inactiveColor: ColorTheme.grey,
                                              value: _minuteValue,
                                              onChanged: (v) {
                                                setState(() {
                                                  _minuteValue = v;
                                                  minute = v.toInt();
                                                });
                                              },
                                            ),
                                            Slider(
                                              min: 0,
                                              max: 60,
                                              activeColor: ColorTheme.mainGreen,
                                              inactiveColor: ColorTheme.grey,
                                              value: _secondValue,
                                              onChanged: (v) {
                                                setState(() {
                                                  _secondValue = v;
                                                  second = v.toInt();
                                                });
                                              },
                                            )
                                          ],
                                        )))
                          ])),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void changeDate({BuildContext context}) {
    String _date = DateFormat('yyyy-MM-dd').format(startDate);
    if (hour <= 9) {
      _date = _date +
          ' 0' +
          hour.toString() +
          ':' +
          minute.toString() +
          ':' +
          second.toString();
    } else {
      _date = _date +
          ' ' +
          hour.toString() +
          ':' +
          minute.toString() +
          ':' +
          second.toString();
    }
  }
}
