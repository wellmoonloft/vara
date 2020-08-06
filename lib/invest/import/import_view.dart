import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/db_helper.dart';

import 'mapping_left.dart';

class ImportView extends StatefulWidget {
  @override
  _ImportViewState createState() => _ImportViewState();
}

class _ImportViewState extends State<ImportView> {
  String _path;
  String _extension;
  FileType _pickingType = FileType.any;

  int investtime = 0;
  int pertime = 0;
  int investamount = 0;
  int endtime = 0;
  int received = 0;
  int investcode = 0;
  int investtype = 0;
  int status = 0;
  int interest = 0;
  int currency = 0;
  int country = 0;
  String dropdownMenu1;
  String dropdownMenu2;
  String dropdownMenu3;
  String dropdownMenu4;
  String dropdownMenu5;
  String dropdownMenu6;
  String dropdownMenu7;
  String dropdownMenu8;
  String dropdownMenu9;
  String dropdownMenu10;
  String dropdownMenu11;

  var items = List<DropdownMenuItem<String>>();
  var items1 = List<DropdownMenuItem<String>>();

  String hintText = 'Choose Cell';

  @override
  void initState() {
    _openFileExplorer();
    super.initState();
  }

  void save() async {
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
                if (cell.value == dropdownMenu3) {
                  investtime = cell.colIndex;
                } else if (cell.value == dropdownMenu4) {
                  pertime = cell.colIndex;
                } else if (cell.value == dropdownMenu2) {
                  investamount = cell.colIndex;
                } else if (cell.value == dropdownMenu5) {
                  endtime = cell.colIndex;
                } else if (cell.value == dropdownMenu7) {
                  received = cell.colIndex;
                } else if (cell.value == dropdownMenu1) {
                  investcode = cell.colIndex;
                } else if (cell.value == dropdownMenu8) {
                  investtype = cell.colIndex;
                } else if (cell.value == dropdownMenu9) {
                  status = cell.colIndex;
                } else if (cell.value == dropdownMenu6) {
                  interest = cell.colIndex;
                } else if (cell.value == dropdownMenu10) {
                  currency = cell.colIndex;
                } else if (cell.value == dropdownMenu11) {
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
    Navigator.pop(context);
  }

  _openFileExplorer() async {
    try {
      _path = await FilePicker.getFilePath(
          type: _pickingType,
          allowedExtensions: (_extension?.isNotEmpty ?? false)
              ? _extension?.replaceAll(' ', '')?.split(',')
              : null);
      if (_path == null) {
        Navigator.pop(context);
      } else {
        var bytes = File(_path).readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);

        for (var table in excel.tables.keys) {
          excel.tables[table].row(0).forEach((cell) {
            items1.add(DropdownMenuItem(
                child: Text(
                  cell.value,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                value: cell.colIndex.toString()));
          });
        }
        setState(() {
          items = items1;
        });
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorTheme.white,
        child: Scaffold(
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: ColorTheme.white,
              title: Text('Import',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: ColorTheme.greytripledarker,
                  )),
              leading: BackButton(
                  color: ColorTheme.greytripledarker,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              elevation: 0.0,
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15),
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
                    'Determine data mapping.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorTheme.greydoubledarker,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
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
                                  iconSize: 18,
                                  isExpanded: true,
                                  value: dropdownMenu1,
                                  isDense: false,
                                  hint: Text(hintText),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownMenu1 = newValue;
                                    });
                                  },
                                  items: items,
                                ),
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                hint: Text(hintText),
                                iconSize: 18,
                                isExpanded: true,
                                value: dropdownMenu2,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownMenu2 = newValue;
                                  });
                                },
                                items: items,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                hint: Text(hintText),
                                iconSize: 18,
                                value: dropdownMenu3,
                                isExpanded: true,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownMenu3 = newValue;
                                  });
                                },
                                items: items,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                hint: Text(hintText),
                                iconSize: 18,
                                isExpanded: true,
                                value: dropdownMenu4,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownMenu4 = newValue;
                                  });
                                },
                                items: items,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                hint: Text(hintText),
                                iconSize: 18,
                                value: dropdownMenu5,
                                isExpanded: true,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownMenu5 = newValue;
                                  });
                                },
                                items: items,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                hint: Text(hintText),
                                iconSize: 18,
                                value: dropdownMenu6,
                                isExpanded: true,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownMenu6 = newValue;
                                  });
                                },
                                items: items,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                hint: Text(hintText),
                                iconSize: 18,
                                value: dropdownMenu7,
                                isExpanded: true,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownMenu7 = newValue;
                                  });
                                },
                                items: items,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                hint: Text(hintText),
                                iconSize: 18,
                                value: dropdownMenu8,
                                isExpanded: true,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownMenu8 = newValue;
                                  });
                                },
                                items: items,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                hint: Text(hintText),
                                iconSize: 18,
                                value: dropdownMenu9,
                                isExpanded: true,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownMenu9 = newValue;
                                  });
                                },
                                items: items,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                hint: Text(hintText),
                                iconSize: 18,
                                value: dropdownMenu10,
                                isExpanded: true,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownMenu10 = newValue;
                                  });
                                },
                                items: items,
                              ),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                hint: Text(hintText),
                                iconSize: 18,
                                value: dropdownMenu11,
                                isExpanded: true,
                                isDense: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownMenu11 = newValue;
                                  });
                                },
                                items: items,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: MappingMid(),
                      ),
                      Expanded(
                        flex: 2,
                        child: MappingLeft(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: ColorTheme.pale,
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
                                  save();
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
            )));
  }
}
