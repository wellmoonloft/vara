import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/utils/app_common.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/toolkit.dart';
import 'package:vara/utils/app_theme.dart';

class BillListView extends StatefulWidget {
  //final List<Map> investList;

  const BillListView({Key key}) : super(key: key);
  @override
  BillListState createState() => BillListState();
}

class BillListState extends State<BillListView> {
  List<Map> current = List<Map>();
  List<Map> later = List<Map>();
  List<Map> finished = List<Map>();
  List<Map> billList;
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
    billList = Provider.of<InvestData>(context).billList;
    if (billList != null) {
      billList.forEach((element) {
        current.add(element);
      });
    }
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: ColorTheme.white,
        elevation: 0,
        title: Text('Bill List', style: AppTheme.titleText),
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
                            'Mark',
                            textAlign: TextAlign.center,
                            style: AppTheme.subtitleText,
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            'Use',
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
                                    if (billList != null) {
                                      billList.forEach((element) {
                                        current.add(element);
                                      });
                                    }
                                  });
                                } else if (newValue == 'CURRENT') {
                                  setState(() {
                                    current.clear();
                                    print(current.length);
                                    countryValue = newValue;
                                    if (billList != null) {
                                      billList.forEach((element) {
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
                                    if (billList != null) {
                                      billList.forEach((element) {
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
                var bill = current[index];
                return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: InvestList(
                          title1: 'Bill Amount',
                          title2: formatNum(bill['amount'], 2).toString() +
                              ' ' +
                              bill['currency'],
                          title3: 'Bill Time',
                          title4: bill['date'],
                          title5: 'use',
                          title6: bill['use'],
                          title7: 'Mark',
                          title8: bill['mark'],
                        )));
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
