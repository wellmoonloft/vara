import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/color_theme.dart';
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
        title: Text(S.current.InvestList, style: AppTheme.titleText),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 20,
            color: ColorTheme.greytripledarker,
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
                          child: Text(
                            S.current.Date,
                            textAlign: TextAlign.center,
                            style: AppTheme.subtitleText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            S.current.Status,
                            textAlign: TextAlign.center,
                            style: AppTheme.subtitleText,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                              onTap: () async {
                                var result = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    initialDatePickerMode: DatePickerMode.day,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2030));
                                if (result != null) {
                                  setState(() {
                                    date = DateFormat('yyyy-MM')
                                        .format(result)
                                        .toString();
                                  });
                                  chooseDate(date, countryValue);
                                }
                              },
                              child: Container(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  date,
                                  style: AppTheme.titleTextSmallLighter,
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
                                                padding: const EdgeInsets.only(
                                                    bottom: 6),
                                                child: Text(
                                                  // invest.code +
                                                  //     ' | ' +
                                                  NumberFormat("###,###.0#",
                                                              "en_US")
                                                          .format(
                                                              invest.amount) +
                                                      ' ' +
                                                      invest.currency,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    color: ColorTheme
                                                        .greydoubledarker,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    bottom: 6),
                                                child: Text(
                                                  invest.date +
                                                      ' | ' +
                                                      invest.endDate,
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: AppTheme.subtitleText,
                                                ),
                                              ),
                                            ]),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 6, bottom: 6),
                                          child: Text(
                                            invest.status,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: (invest.status == 'LATE')
                                                  ? ColorTheme.cantaloupedarker
                                                  : ColorTheme.neogreendarker,
                                            ),
                                          ),
                                        ),
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
