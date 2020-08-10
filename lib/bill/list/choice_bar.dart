import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vara/utils/color_theme.dart';

class ChoiceBar extends StatefulWidget {
  @override
  ChoiceBarState createState() => ChoiceBarState();
}

class ChoiceBarState extends State<ChoiceBar> {
  String date = DateFormat('yyyy-MM').format(DateTime.now()).toString();
  String moneyValue = 'ALL';
  String termValue = 'ALL';
  String countryValue = 'ALL';

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: ColorTheme.grey,
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text(
                      'Money',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: ColorTheme.grey,
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text(
                      'Term',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: ColorTheme.grey,
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text(
                      'Country',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: ColorTheme.grey,
                      ),
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
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorTheme.greytripledarker),
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
                        onChanged: (String newValue) {
                          setState(() {
                            moneyValue = newValue;
                          });
                        },
                        items: <String>['ALL', 'USD', 'EUR', 'CNY', 'JPY']
                            .map<DropdownMenuItem<String>>((String value) {
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
                        //focusColor: ColorTheme.black,
                        value: termValue,
                        iconSize: 18,
                        onChanged: (String newValue) {
                          setState(() {
                            termValue = newValue;
                          });
                        },
                        items: <String>['ALL', 'SHORT', 'MID', 'LONG']
                            .map<DropdownMenuItem<String>>((String value) {
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
                        //focusColor: ColorTheme.black,
                        value: countryValue,
                        iconSize: 18,
                        onChanged: (String newValue) {
                          setState(() {
                            countryValue = newValue;
                          });
                        },
                        items: <String>['ALL', 'SHORT', 'MID', 'LONG']
                            .map<DropdownMenuItem<String>>((String value) {
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
            ]));
  }
}