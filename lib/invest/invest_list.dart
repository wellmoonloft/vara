import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import 'package:vara/theme_ui/common/calendar_popup_view.dart';
import 'package:vara/utils/dateutil.dart';
import 'invest_detail.dart';
import 'package:vara/theme_ui/app_theme.dart';

class InvestListView extends StatefulWidget {
  const InvestListView({Key key}) : super(key: key);
  @override
  InvestListState createState() => InvestListState();
}

class InvestListState extends State<InvestListView>
    with TickerProviderStateMixin {
  List<Invest> current = List<Invest>();
  List<Invest> later = List<Invest>();
  List<Invest> finished = List<Invest>();
  List<Invest> investList;
  String date = S.current.ChooseDate;
  String date1;
  String countryValue1 = 'ALL';
  bool mark = true;
  bool dayBottom = false;
  bool weekBottom = false;
  bool monthBottom = true;
  bool yearBottom = false;

  var mTab = [S.current.CURRENT, S.current.LATE, S.current.FINISHED];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: mTab.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    investList = Provider.of<ProviderData>(context).investList;
    if (mark) {
      setData(investList);
      mark = false;
    }

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: ColorTheme.white,
        elevation: 0,
        title: Text(S.current.InvestList, style: AppTheme.subPageTitle),
        leading: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: 18,
              color: ColorTheme.mainBlack,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        bottom: TabBar(
          tabs: mTab.map((f) {
            return Text(f);
          }).toList(),
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: ColorTheme.mainBlack,
          labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),
      body: TabBarView(
          children: mTab.map((f) {
            List<Invest> data = List<Invest>();
            if (f == S.current.CURRENT) {
              data = current;
            } else if (f == S.current.LATE) {
              data = later;
            } else {
              data = finished;
            }
            return Column(
              children: <Widget>[
                Container(
                  color: ColorTheme.white,
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
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
                                        DateUtils.weekStart(DateTime.now());
                                    //print(weekStart);

                                    DateTime weekEnd =
                                        DateUtils.weekEnd(DateTime.now())
                                            .add(Duration(days: 1));
                                    List<Invest> _data = List<Invest>();
                                    if (investList != null) {
                                      investList.forEach((element) {
                                        DateTime _date =
                                            DateTime.parse(element.date);
                                        if (_date.isAfter(weekStart) &&
                                            _date.isBefore(weekEnd)) {
                                          _data.add(element);
                                        }
                                      });
                                      setData(_data);
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

                                    List<Invest> _data = List<Invest>();
                                    if (investList != null) {
                                      investList.forEach((element) {
                                        if (element.date.substring(0, 7) ==
                                            _date) {
                                          _data.add(element);
                                        }
                                      });
                                      setData(_data);
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

                                    List<Invest> _data = List<Invest>();
                                    if (investList != null) {
                                      investList.forEach((element) {
                                        if (element.date.substring(0, 4) ==
                                            _date) {
                                          _data.add(element);
                                        }
                                      });
                                      setData(_data);
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
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: ListView.separated(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var invest = data[index];
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => InvestDetail(
                                              investdetail: invest),
                                        ));
                                  },
                                  child: Container(
                                      color: ColorTheme.white,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                          padding: AppTheme.inboxpadding,
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
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 6),
                                                        child: NumbersText(
                                                            value: invest.amount
                                                                .toDouble(),
                                                            style: AppTheme
                                                                .subPageTitle,
                                                            currency: invest
                                                                .currency)),
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 6),
                                                        child: Text(
                                                          invest.code,
                                                          style: AppTheme
                                                              .noteContent,
                                                        )),
                                                  ]),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 6,
                                                              bottom: 6),
                                                      child: Text(
                                                        invest.status,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 16,
                                                          color: (invest
                                                                      .status ==
                                                                  'LATE')
                                                              ? ColorTheme
                                                                  .cantaloupedarker
                                                              : ColorTheme
                                                                  .neogreendarker,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      invest.date +
                                                          ' | ' +
                                                          invest.endDate,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style:
                                                          AppTheme.noteContent,
                                                    ),
                                                  ])
                                            ],
                                          ))))));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: ColorTheme.background,
                        height: 2,
                      );
                    },
                  ),
                )
              ],
            );
          }).toList(),
          controller: _tabController,
          physics: ScrollPhysics()),
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
          List<Invest> _data = List<Invest>();
          setState(() {
            current.clear();
            dayBottom = true;
            weekBottom = false;
            monthBottom = false;
            yearBottom = false;
            if (mark == 0) {
              if (investList != null) {
                investList.forEach((element) {
                  if (element.date.substring(0, 7) ==
                      DateFormat('yyyy-MM').format(month)) {
                    _data.add(element);
                  }
                });
                date = DateFormat('yyyy-MM').format(month);
              }
            } else if (mark == 1) {
              if (investList != null) {
                investList.forEach((element) {
                  DateTime _date = DateTime.parse(element.date);
                  if (DateFormat('yyyy-MM-dd').format(_date) ==
                      DateFormat('yyyy-MM-dd').format(startData)) {
                    _data.add(element);
                  }
                });
                date = DateFormat('yyyy-MM-dd').format(startData);
              }
            } else {
              if (investList != null) {
                investList.forEach((element) {
                  DateTime _date = DateTime.parse(element.date);
                  if (_date.isAfter(startData) && _date.isBefore(endData)) {
                    _data.add(element);
                  }
                });
                date = DateFormat('yyyy-MM-dd').format(startData);
                date1 = DateFormat('yyyy-MM-dd').format(endData);
              }
            }
            setData(_data);
          });
        },
        onCancelClick: () {},
      ),
    );
  }

  setData(List<Invest> investList) {
    if (investList != null) {
      current.clear();
      later.clear();
      finished.clear();
      investList.forEach((element) {
        if (element.status == 'CURRENT') {
          current.add(element);
        } else if (element.status == 'LATE') {
          later.add(element);
        } else {
          finished.add(element);
        }
      });
    }
  }
}
