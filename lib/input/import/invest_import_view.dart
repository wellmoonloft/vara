import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/theme_ui/app_theme.dart';

import 'package:vara/models/db_models.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/progress_dialog.dart';
import 'mapping_left.dart';

class InvestImportView extends StatefulWidget {
  const InvestImportView({Key key}) : super(key: key);
  @override
  _ImportViewState createState() => _ImportViewState();
}

class _ImportViewState extends State<InvestImportView> {
  String _path;
  String _extension;
  FileType _pickingType = FileType.any;
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

  var bytes;
  var excel;
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
      if (_path == null) {
      } else {
        var providerData = Provider.of<ProviderData>(context, listen: false);

        for (var table in excel.tables.keys) {
          print('table   ' + table);
          print('excel.tables maxCols   ' +
              excel.tables[table].maxCols.toString());
          print('excel.tables maxRows   ' +
              excel.tables[table].maxRows.toString());

          for (int row = 0; row < excel.tables[table].maxRows; row++) {
            Invest invest = new Invest();

            if (row > 0) {
              excel.tables[table].row(row).forEach((cell) {
                var val = cell.value;
                //print("Cell  |" + row.toString() + "|  $val");

                if (cell.colIndex == int.parse(dropdownMenu1)) {
                  invest.code = val.toString();
                } else if (cell.colIndex == int.parse(dropdownMenu2)) {
                  invest.amount = val;
                } else if (cell.colIndex == int.parse(dropdownMenu3)) {
                  invest.date = val.toString();
                } else if (cell.colIndex == int.parse(dropdownMenu4)) {
                  invest.perDate = val.toString();
                } else if (cell.colIndex == int.parse(dropdownMenu5)) {
                  invest.endDate = val.toString();
                } else if (cell.colIndex == int.parse(dropdownMenu6)) {
                  invest.received = val;
                } else if (cell.colIndex == int.parse(dropdownMenu7)) {
                  invest.type = val.toString();
                } else if (cell.colIndex == int.parse(dropdownMenu8)) {
                  invest.status = val.toString();
                } else if (cell.colIndex == int.parse(dropdownMenu9)) {
                  invest.currency = val.toString();
                } else if (cell.colIndex == int.parse(dropdownMenu10)) {
                  invest.country = val.toString();
                }
              });
              await providerData.updateInvestandData(invest);
            }
          }
        }
        await providerData.getAssetList();
        await providerData.getinvestList();
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    ProgressDialog.dismiss(context);
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
        bytes = File(_path).readAsBytesSync();
        excel = Excel.decodeBytes(bytes);

        for (var table in excel.tables.keys) {
          excel.tables[table].row(0).forEach((cell) {
            if (cell.value != null) {
              items1.add(DropdownMenuItem(
                  child: Text(
                    cell.value,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  value: cell.colIndex.toString()));
            }
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
              title: Text('Import', style: AppTheme.titleText),
              leading: BackButton(
                  color: ColorTheme.greytripledarker,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              elevation: 0.0,
            ),
            backgroundColor: Colors.transparent,
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    alignment: Alignment.center,
                    child: FaIcon(
                      FontAwesomeIcons.solidFileExcel,
                      color: ColorTheme.neogreendarker,
                      size: 60,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Determine data mapping.',
                        style: AppTheme.titleTextSmallLighter,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
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
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: MappingMid(),
                      ),
                      Expanded(
                        flex: 4,
                        child: MappingLeft(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                      alignment: Alignment.center,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: ColorTheme.pale,
                          borderRadius: AppTheme.normalBorderRadius,
                        ),
                        child: Container(
                            height: 45,
                            width: 200,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: InkWell(
                                    onTap: () {
                                      ProgressDialog.showProgress(context);
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
                      )),
                )
              ],
            )));
  }
}
