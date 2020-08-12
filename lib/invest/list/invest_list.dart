import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/utils/app_ui.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/toolkit.dart';
import 'invest_detail.dart';
import 'package:vara/utils/app_theme.dart';

class InvestListView extends StatefulWidget {
  //final List<Map> investList;

  const InvestListView({Key key}) : super(key: key);
  @override
  InvestListState createState() => InvestListState();
}

class InvestListState extends State<InvestListView> {
  List<Map> current = List<Map>();
  List<Map> later = List<Map>();
  List<Map> finished = List<Map>();
  List<Map> investList;
  String date = DateFormat('yyyy-MM').format(DateTime.now()).toString();
  String moneyValue = 'ALL';
  String termValue = 'ALL';
  String countryValue = 'ALL';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    investList = Provider.of<InvestData>(context).investList;
    if (investList != null) {
      investList.forEach((element) {
        current.add(element);
      });
    }
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: ColorTheme.white,
        elevation: 0,
        title: Text('Invest List', style: AppTheme.titleText),
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
                            'Date',
                            textAlign: TextAlign.center,
                            style: AppTheme.subtitleText,
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            'Money',
                            textAlign: TextAlign.center,
                            style: AppTheme.subtitleText,
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            'Status',
                            textAlign: TextAlign.center,
                            style: AppTheme.subtitleText,
                          ),
                          flex: 1,
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
                                }
                                print('$result');
                              },
                              child: Container(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  date,
                                  style: AppTheme.titleTextSmallLighter,
                                ),
                              )),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment(0, 0),
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: moneyValue,
                              iconSize: 18,
                              underline: Container(),
                              onChanged: (String newValue) {
                                setState(() {
                                  moneyValue = newValue;
                                });
                              },
                              items: <String>[
                                'ALL',
                                'USD',
                                'EUR',
                                'CNY',
                                'JPY'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          flex: 1,
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
                                if (newValue == 'ALL') {
                                  setState(() {
                                    current.clear();
                                    print(current.length);
                                    countryValue = newValue;
                                    if (investList != null) {
                                      investList.forEach((element) {
                                        current.add(element);
                                      });
                                    }
                                  });
                                } else if (newValue == 'CURRENT') {
                                  setState(() {
                                    current.clear();
                                    print(current.length);
                                    countryValue = newValue;
                                    if (investList != null) {
                                      investList.forEach((element) {
                                        if (element['status'] == 'CURRENT') {
                                          current.add(element);
                                        }
                                      });
                                    }
                                  });
                                } else {
                                  setState(() {
                                    current.clear();
                                    print(current.length);
                                    countryValue = newValue;
                                    if (investList != null) {
                                      investList.forEach((element) {
                                        if (element['status'] == 'LATE') {
                                          current.add(element);
                                        }
                                      });
                                      print(current.length);
                                    }
                                  });
                                }
                              },
                              items: <String>[
                                'ALL',
                                'CURRENT',
                                'LATE'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          flex: 1,
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
                            child: InvestList(
                              title1: formatNum(invest['investamount'], 2)
                                      .toString() +
                                  ' ' +
                                  invest['currency'],
                              title2:
                                  formatNum(invest['interest'], 2).toString() +
                                      invest['currency'],
                              title3: invest['investtime'],
                              title4: invest['status'],
                              title5: 'Status',
                              title6: 'Interest',
                              title7: 'Invest Time',
                              title8: 'Invest Amount',
                            ))));
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
}
