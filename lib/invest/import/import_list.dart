import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/db_helper.dart';

import 'mapping_left.dart';

class InvestImportList extends StatefulWidget {
  final String path;

  const InvestImportList({Key key, this.path}) : super(key: key);
  @override
  InvestImportListState createState() => InvestImportListState();
}

class InvestImportListState extends State<InvestImportList> {
  String _path;
  String _extension;
  FileType _pickingType = FileType.any;
  double distValue = 50.0;

  @override
  void initState() {
    //_navigatorAfterGetData();
    getItems();
    super.initState();
  }

  String investcode = '22';

  getItems() {
    var items = List<DropdownMenuItem<String>>();
    items.add(DropdownMenuItem(child: Text("AA"), value: "11"));
    items.add(DropdownMenuItem(
      child: Text("BB"),
      value: "22",
    ));
    items.add(DropdownMenuItem(
      child: Text("CC"),
      value: "33",
    ));
    items.add(DropdownMenuItem(
      child: Text("DD"),
      value: "44",
    ));
    items.add(DropdownMenuItem(
      child: Text("EE"),
      value: "55",
    ));
    return items;
  }

  void _openFileExplorer() async {
    try {
      _path = await FilePicker.getFilePath(
          type: _pickingType,
          allowedExtensions: (_extension?.isNotEmpty ?? false)
              ? _extension?.replaceAll(' ', '')?.split(',')
              : null);
      if (_path == null) {
      } else {
        var bytes = File(_path).readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);
        int investtime = 0;
        int pertime = 0;
        int investamount = 0;
        int endtime = 0;
        int received = 0;
        int investcode = 0;
        int investtype = 0;
        int status = 0;
        int interest = 0;
        int currency = 0; //Estimated next payment (interest)
        int country = 0;
        Invest invest = new Invest();
        List investlist = await DBHelper().getInvest();

        for (var table in excel.tables.keys) {
          print('table   ' + table);
          print('excel.tables maxCols   ' +
              excel.tables[table].maxCols.toString());
          print('excel.tables maxRows   ' +
              excel.tables[table].maxRows.toString());

          for (int row = 0; row < excel.tables[table].maxRows; row++) {
            excel.tables[table].row(row).forEach((cell) {
              var val = cell.value;
              if (row == 0) {
                if (cell.value == 'Date of purchase') {
                  investtime = cell.colIndex;
                } else if (cell.value == 'Estimated payment date') {
                  pertime = cell.colIndex;
                } else if (cell.value == 'Invested amount') {
                  investamount = cell.colIndex;
                } else if (cell.value == 'Final payment date') {
                  endtime = cell.colIndex;
                } else if (cell.value == 'Received payments') {
                  received = cell.colIndex;
                } else if (cell.value == 'Loan ID') {
                  investcode = cell.colIndex;
                } else if (cell.value == 'Loan type') {
                  investtype = cell.colIndex;
                } else if (cell.value == 'Status') {
                  status = cell.colIndex;
                } else if (cell.value == 'Estimated next payment (interest)') {
                  interest = cell.colIndex;
                } else if (cell.value == 'Estimated next payment (principal)') {
                  currency = cell.colIndex;
                } else if (cell.value == 'Country') {
                  country = cell.colIndex;
                }
              } else {
                print("Cell  |" + row.toString() + "|  $val");

                if (cell.colIndex == investtime) {
                  invest.investtime = val.toString();
                } else if (cell.colIndex == pertime) {
                  invest.pertime = val.toString();
                } else if (cell.colIndex == investamount) {
                  invest.investamount = val;
                } else if (cell.colIndex == endtime) {
                  invest.endtime = val.toString();
                } else if (cell.colIndex == received) {
                  invest.received = val;
                } else if (cell.colIndex == investcode) {
                  invest.investcode = val.toString();
                } else if (cell.colIndex == investtype) {
                  invest.investtype = val;
                } else if (cell.colIndex == status) {
                  invest.status = val.toString();
                } else if (cell.colIndex == interest) {
                  invest.interest = val;
                } else if (cell.colIndex == currency) {
                  invest.currency = 'EUR';
                } else if (cell.colIndex == country) {
                  invest.country = val.toString();
                }
              }
            });
            if (row > 0) {
              print('=========');
              invest.id = investlist.length + row;
              await DBHelper().addData(invest);
            }
          }
        }
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topRight: Radius.circular(8.0)),
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          width: MediaQuery.of(context).size.width - 32,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'IMPORT FROM XLSX',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorTheme.greydoubledarker,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/Icons/xlsx.png'),
                    ),
                  ),
                  child: SizedBox(
                    height: 65,
                    width: 65,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Make sure data mapping.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorTheme.greydoubledarker,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: MappingLeft(),
                    ),
                    Expanded(
                      flex: 1,
                      child: MappingMid(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                value: investcode,
                                iconSize: 18,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    investcode = newValue;
                                  });
                                },
                                items: getItems(),
                              ),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: investcode,
                              iconSize: 18,
                              isDense: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  investcode = newValue;
                                });
                              },
                              items: getItems(),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: investcode,
                              iconSize: 18,
                              isDense: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  investcode = newValue;
                                });
                              },
                              items: getItems(),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: investcode,
                              iconSize: 18,
                              isDense: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  investcode = newValue;
                                });
                              },
                              items: getItems(),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: investcode,
                              iconSize: 18,
                              isDense: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  investcode = newValue;
                                });
                              },
                              items: getItems(),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: investcode,
                              iconSize: 18,
                              isDense: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  investcode = newValue;
                                });
                              },
                              items: getItems(),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: investcode,
                              iconSize: 18,
                              isDense: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  investcode = newValue;
                                });
                              },
                              items: getItems(),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: investcode,
                              iconSize: 18,
                              isDense: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  investcode = newValue;
                                });
                              },
                              items: getItems(),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: investcode,
                              iconSize: 18,
                              isDense: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  investcode = newValue;
                                });
                              },
                              items: getItems(),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: investcode,
                              iconSize: 18,
                              isDense: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  investcode = newValue;
                                });
                              },
                              items: getItems(),
                            ),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: ColorTheme.white,
                              value: investcode,
                              iconSize: 18,
                              isDense: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  investcode = newValue;
                                });
                              },
                              items: getItems(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorTheme.cassislighter,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                  ),
                  child: Container(
                      height: 45,
                      width: 200,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: InkWell(
                              onTap: () {
                                //_navigateAndDisplaySelection(context);
                              },
                              child: Container(
                                alignment: Alignment(0, 0),
                                child: Text(
                                  'IMPORT',
                                  style: TextStyle(
                                    //fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    letterSpacing: 1.2,
                                    color: ColorTheme.white,
                                  ),
                                ),
                              )))),
                ),
              )
            ],
          ),
        ));
  }
}
