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
import 'invest_detail.dart';
import 'package:vara/theme_ui/app_theme.dart';

class InvestListView extends StatefulWidget {
  const InvestListView({Key key}) : super(key: key);
  @override
  InvestListState createState() => InvestListState();
}

class InvestListState extends State<InvestListView> {
  List<Invest> current = List<Invest>();
  List<Invest> later = List<Invest>();
  List<Invest> finished = List<Invest>();
  List<Invest> investList;
  String date = DateFormat('yyyy-MM').format(DateTime.now()).toString();
  String moneyValue = 'ALL';
  String termValue = 'ALL';
  String countryValue = 'ALL';
  bool mark = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    investList = Provider.of<ProviderData>(context).investList;
    if (investList != null) {
      if (mark) {
        investList.forEach((element) {
          current.add(element);
        });
        mark = false;
      }
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
      ),
      body: Column(
        children: <Widget>[
          Container(
              color: ColorTheme.white,
              padding: EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(S.current.Date,
                              textAlign: TextAlign.center,
                              style: AppTheme.listTitle),
                        ),
                        Expanded(
                          child: Text(S.current.Status,
                              textAlign: TextAlign.center,
                              style: AppTheme.listTitle),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                              onTap: () async {
                                showCalendar(context: context);
                              },
                              child: Container(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  date,
                                  style: AppTheme.noteTitle,
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment(0, 0),
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              underline: Container(),
                              value: countryValue,
                              iconSize: 18,
                              onChanged: (String newValue) {
                                setState(() {
                                  countryValue = newValue;
                                });
                                chooseDate(date, countryValue);
                              },
                              items: <String>[
                                'ALL',
                                'CURRENT',
                                'LATE',
                                'FINISHED'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    )
                  ])),
          Flexible(
            child: ListView.separated(
              itemCount: current.length,
              itemBuilder: (BuildContext context, int index) {
                var invest = current[index];
                return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        InvestDetail(investdetail: invest),
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
                                                      const EdgeInsets.only(
                                                          bottom: 6),
                                                  child: NumbersText(
                                                      value: invest.amount
                                                          .toDouble(),
                                                      style:
                                                          AppTheme.subPageTitle,
                                                      currency:
                                                          invest.currency)),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 6),
                                                  child: Text(
                                                    invest.code,
                                                    style: AppTheme.noteContent,
                                                  )),
                                            ]),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    top: 6, bottom: 6),
                                                child: Text(
                                                  invest.status,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: (invest.status ==
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
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: AppTheme.noteContent,
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
      ),
    );
  }

  void showCalendar({BuildContext context}) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        isSingleDate: false,
        //minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        // initialEndDate: endDate,
        initialStartDate: DateTime.now(),
        onApplyClick:
            (DateTime startData, DateTime endData, DateTime month, int mark) {
          print(startData);
          print(endData);
          print(month);
          setState(() {
            current.clear();
            if (mark == 0) {
              if (investList != null) {
                investList.forEach((element) {
                  if (element.date.substring(0, 7) ==
                      DateFormat('yyyy-MM').format(month)) {
                    if (countryValue == 'ALL') {
                      current.add(element);
                    } else {
                      if (element.status == countryValue) {
                        current.add(element);
                      }
                    }
                  }
                });
              }
            } else if (mark == 1) {
              if (investList != null) {
                investList.forEach((element) {
                  DateTime _date = DateTime.parse(element.date);
                  if (DateFormat('yyyy-MM-dd').format(_date) ==
                      DateFormat('yyyy-MM-dd').format(startData)) {
                    if (countryValue == 'ALL') {
                      current.add(element);
                    } else {
                      if (element.status == countryValue) {
                        current.add(element);
                      }
                    }
                  }
                });
              }
            } else {
              if (investList != null) {
                investList.forEach((element) {
                  DateTime _date = DateTime.parse(element.date);
                  if (_date.isAfter(startData) && _date.isBefore(endData)) {
                    if (countryValue == 'ALL') {
                      current.add(element);
                    } else {
                      if (element.status == countryValue) {
                        current.add(element);
                      }
                    }
                  }
                });
              }
            }
          });
        },
        onCancelClick: () {},
      ),
    );
  }

  chooseDate(_date, _status) {
    setState(() {
      current.clear();
      if (investList != null) {
        investList.forEach((element) {
          if (element.date.substring(0, 7) == _date) {
            if (_status == 'ALL') {
              current.add(element);
            } else {
              if (element.status == _status) {
                current.add(element);
              }
            }
          }
        });
      }
    });
  }
}
