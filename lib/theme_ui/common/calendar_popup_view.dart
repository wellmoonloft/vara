import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
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
                          child: Stack(children: [
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
                                                : S.current.From,
                                            textAlign: TextAlign.left,
                                            style: AppTheme.listTitleThin,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            startDate != null
                                                ? DateFormat('EEE, dd MMM')
                                                    .format(startDate)
                                                : '/',
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
                                                  ? S.current.Time
                                                  : S.current.To,
                                              style: AppTheme.listTitleThin,
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
                                                          ' : ' +
                                                          (minute < 10
                                                              ? '0' +
                                                                  minute
                                                                      .toString()
                                                              : minute
                                                                  .toString()) +
                                                          ' : ' +
                                                          (second < 10
                                                              ? '0' +
                                                                  second
                                                                      .toString()
                                                              : second
                                                                  .toString())
                                                      : (endDate != null
                                                          ? DateFormat(
                                                                  'EEE, dd MMM')
                                                              .format(endDate)
                                                          : '/'),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                widget.isSingleDate
                                                    ? SizedBox(
                                                        width: 12,
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
                                    padding: const EdgeInsets.all(24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              S.current.Cancel,
                                              textAlign: TextAlign.end,
                                              style: AppTheme.subPageTitle,
                                            )),
                                        InkWell(
                                            onTap: () {
                                              try {
                                                // animationController.reverse().then((f) {

                                                // });
                                                if (widget.isSingleDate) {
                                                  changeDate();
                                                }

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
                                              style: AppTheme.subPageTitle,
                                            )),
                                      ],
                                    )),
                              ],
                            ),
                            Positioned(
                                right: 30,
                                top: 65,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          ColorTheme.mainBlack.withOpacity(0.1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                    ),
                                    child: timeMark
                                        ? Container()
                                        : Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Slider(
                                                    min: 0,
                                                    max: 24,
                                                    activeColor:
                                                        ColorTheme.mainGreen,
                                                    inactiveColor:
                                                        ColorTheme.grey,
                                                    value: _hourValue,
                                                    onChanged: (v) {
                                                      setState(() {
                                                        _hourValue = v;
                                                        hour = v.toInt();
                                                      });
                                                    },
                                                  )),
                                              RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Slider(
                                                    min: 0,
                                                    max: 60,
                                                    activeColor:
                                                        ColorTheme.mainGreen,
                                                    inactiveColor:
                                                        ColorTheme.grey,
                                                    value: _minuteValue,
                                                    onChanged: (v) {
                                                      setState(() {
                                                        _minuteValue = v;
                                                        minute = v.toInt();
                                                      });
                                                    },
                                                  )),
                                              RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Slider(
                                                    min: 0,
                                                    max: 60,
                                                    activeColor:
                                                        ColorTheme.mainGreen,
                                                    inactiveColor:
                                                        ColorTheme.grey,
                                                    value: _secondValue,
                                                    onChanged: (v) {
                                                      setState(() {
                                                        _secondValue = v;
                                                        second = v.toInt();
                                                      });
                                                    },
                                                  ))
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

  void changeDate() {
    String _date = DateFormat('yyyy-MM-dd').format(startDate);
    String _hour;
    String _minute;
    String _second;

    if (hour <= 9) {
      _hour = '0' + hour.toString();
    } else {
      _hour = hour.toString();
    }
    if (minute <= 9) {
      _minute = '0' + minute.toString();
    } else {
      _minute = minute.toString();
    }
    if (second <= 9) {
      _second = '0' + second.toString();
    } else {
      _second = second.toString();
    }
    _date = _date + ' ' + _hour + ':' + _minute + ':' + _second;

    setState(() {
      startDate = DateTime.parse(_date);
    });
  }
}
