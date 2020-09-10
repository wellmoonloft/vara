import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

class CalendarTimeView extends StatefulWidget {
  const CalendarTimeView({Key key, this.onApplyClick, this.onCancelClick})
      : super(key: key);

  final Function(int, int, int) onApplyClick;
  final Function onCancelClick;
  @override
  _CalendarPopupViewState createState() => _CalendarPopupViewState();
}

class _CalendarPopupViewState extends State<CalendarTimeView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  double _hourValue = 12;
  double _minuteValue = 30;
  double _secondValue = 30;
  bool timeMark = false;
  int hour = 12;
  int minute = 30;
  int second = 30;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

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
    return Positioned(
        right: 16,
        top: 80,
        child: Container(
            padding: AppTheme.inboxpadding,
            decoration: BoxDecoration(
              color: ColorTheme.mainBlack,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            //width: MediaQuery.of(context).size.width - 80,
            //height: 120,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hour: ',
                      style: AppTheme.listTitleWhite,
                    ),
                    Text(
                      hour < 10 ? '0' + hour.toString() : hour.toString(),
                      style: AppTheme.listTitleWhite,
                    ),
                    Text(
                      'Minute: ',
                      style: AppTheme.listTitleWhite,
                    ),
                    Text(
                      minute.toString(),
                      style: AppTheme.listTitleWhite,
                    ),
                    Text(
                      'Second: ',
                      style: AppTheme.listTitleWhite,
                    ),
                    Text(
                      second.toString(),
                      style: AppTheme.listTitleWhite,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hour',
                      textAlign: TextAlign.left,
                      style: AppTheme.listTitleWhite,
                    ),
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
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Minute',
                      style: AppTheme.listTitleWhite,
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
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Second',
                      style: AppTheme.listTitleWhite,
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
                        widget.onApplyClick(hour, minute, second);
                      },
                    )
                  ],
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              widget.onCancelClick();
                            },
                            child: Text(
                              S.current.Cancel,
                              textAlign: TextAlign.end,
                              style: AppTheme.listTitleWhite,
                            )),
                        SizedBox(
                          width: 28,
                        ),
                        InkWell(
                            onTap: () {
                              try {
                                if (hour <= 24 &&
                                    minute <= 60 &&
                                    second <= 60) {
                                  widget.onApplyClick(hour, minute, second);
                                  setState(() {
                                    timeMark = true;
                                  });
                                } else {
                                  widget.onCancelClick();
                                }
                              } catch (_) {}
                            },
                            child: Text(
                              S.current.Confirm,
                              textAlign: TextAlign.end,
                              style: AppTheme.listTitleWhite,
                            )),
                      ],
                    ))
              ],
            )));
  }
}
