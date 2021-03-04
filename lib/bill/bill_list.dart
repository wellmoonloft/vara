import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/theme_ui/common/calendar_popup_view.dart';
import 'package:vara/bill/bill_detail.dart';
import 'package:vara/utils/dateutil.dart';
import 'package:vara/theme_ui/common/app_common.dart';

class BillListView extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;

  const BillListView({Key key, this.animationController, this.animation})
      : super(key: key);

  @override
  BillListState createState() => BillListState();
}

class BillListState extends State<BillListView> {
  List<Bill> current = List<Bill>();
  List<Bill> billList;
  String date = S.current.ChooseDate;
  String date1;
  bool mark = true;
  bool dayBottom = false;
  bool weekBottom = false;
  bool monthBottom = true;
  bool yearBottom = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    billList = Provider.of<ProviderData>(context).billList;

    if (billList != null) {
      if (mark) {
        billList.forEach((element) {
          current.add(element);
        });
        mark = false;
      }
    }

    return AnimatedBuilder(
        animation: widget.animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
              opacity: widget.animation,
              child: new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - widget.animation.value), 0.0),
                  child: Column(children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 20, bottom: 16),
                        child: Container(
                            //decoration: AppTheme.boxDecoration,
                            child: Column(children: <Widget>[
                          Row(
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                              ? AppTheme
                                                                  .subPageTitle
                                                              : AppTheme
                                                                  .noteTitle,
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
                                              color: dayBottom
                                                  ? ColorTheme.mainGreen
                                                  : ColorTheme.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
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
                                            date1 = null;
                                            current.clear();
                                            DateTime weekStart =
                                                MyDateUtils.weekStart(
                                                    DateTime.now());
                                            //print(weekStart);

                                            DateTime weekEnd =
                                                MyDateUtils.weekEnd(
                                                        DateTime.now())
                                                    .add(Duration(days: 1));
                                            if (billList != null) {
                                              billList.forEach((element) {
                                                DateTime _date = DateTime.parse(
                                                    element.date);
                                                if (_date.isAfter(weekStart) &&
                                                    _date.isBefore(weekEnd)) {
                                                  current.add(element);
                                                }
                                              });
                                            }
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
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
                                            String _date = DateFormat('yyyy-MM')
                                                .format(DateTime.now());
                                            current.clear();
                                            if (billList != null) {
                                              billList.forEach((element) {
                                                if (element.date
                                                        .substring(0, 7) ==
                                                    _date) {
                                                  current.add(element);
                                                }
                                              });
                                            }
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
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
                                            String _date = DateFormat('yyyy')
                                                .format(DateTime.now());
                                            current.clear();
                                            if (billList != null) {
                                              billList.forEach((element) {
                                                if (element.date
                                                        .substring(0, 4) ==
                                                    _date) {
                                                  current.add(element);
                                                }
                                              });
                                            }
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
                                            ),
                                          )
                                        ],
                                      )),
                                  flex: 1),
                            ],
                          ),
                          SizedBox(
                            height: 14,
                          )
                        ]))),
                    MediaQuery.removePadding(
                        //removeTop Padding
                        removeTop: true,
                        context: context,
                        child: ListView.separated(
                          itemCount: current.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var bill = current[index];

                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BillDetail(billdetail: bill),
                                      ));
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 5,
                                            bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 6),
                                                      child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 9),
                                                                child: FaIcon(
                                                                  bill.mark == 0
                                                                      ? FontAwesomeIcons
                                                                          .minus
                                                                      : FontAwesomeIcons
                                                                          .plus,
                                                                  size: 8,
                                                                  color: ColorTheme
                                                                      .mainBlack,
                                                                )),
                                                            SizedBox(
                                                              width: 6,
                                                            ),
                                                            NumbersText(
                                                              value: bill.mark ==
                                                                      0
                                                                  ? bill.amount *
                                                                      widget
                                                                          .animation
                                                                          .value
                                                                  : bill.amount *
                                                                      widget
                                                                          .animation
                                                                          .value,
                                                              style: AppTheme
                                                                  .subPageTitle,
                                                              currency:
                                                                  bill.currency,
                                                            )
                                                          ])),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 6),
                                                    child: Text(
                                                      bill.date,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style:
                                                          AppTheme.noteContent,
                                                    ),
                                                  ),
                                                ]),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    top: 6, bottom: 6),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(bill.use,
                                                        style: AppTheme
                                                            .noteContent),
                                                    Text(bill.categroy,
                                                        style: AppTheme
                                                            .noteContent)
                                                  ],
                                                )),
                                          ],
                                        ))));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              color: ColorTheme.background,
                              height: 2,
                            );
                          },
                        ))
                  ])));
        });
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
          setState(() {
            current.clear();
            dayBottom = true;
            weekBottom = false;
            monthBottom = false;
            yearBottom = false;
            if (mark == 0) {
              if (billList != null) {
                billList.forEach((element) {
                  if (element.date.substring(0, 7) ==
                      DateFormat('yyyy-MM').format(month)) {
                    current.add(element);
                  }
                });
                date = DateFormat('yyyy-MM').format(month);
              }
            } else if (mark == 1) {
              if (billList != null) {
                billList.forEach((element) {
                  DateTime _date = DateTime.parse(element.date);
                  if (DateFormat('yyyy-MM-dd').format(_date) ==
                      DateFormat('yyyy-MM-dd').format(startData)) {
                    current.add(element);
                  }
                });
                date = DateFormat('yyyy-MM-dd').format(startData);
              }
            } else {
              if (billList != null) {
                billList.forEach((element) {
                  DateTime _date = DateTime.parse(element.date);
                  if (_date.isAfter(startData) && _date.isBefore(endData)) {
                    current.add(element);
                  }
                });
                date = DateFormat('yyyy-MM-dd').format(startData);
                date1 = DateFormat('yyyy-MM-dd').format(endData);
              }
            }
          });
        },
        onCancelClick: () {},
      ),
    );
  }
}
