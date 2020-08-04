import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/db_helper.dart';

class BillImportView extends StatefulWidget {
  @override
  _BillImportViewState createState() => _BillImportViewState();
}

class _BillImportViewState extends State<BillImportView> {
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  FileType _pickingType = FileType.any;
  double distValue = 50.0;

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _paths = null;
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
                } else if (cell.colIndex == currency) {
                  invest.currency = 'EUR';
                } else if (cell.colIndex == country) {
                  invest.country = val.toString();
                }
              }
              //cell.value = ' My custom Value ';
            });
            print('=========');
            invest.id = investlist.length + row;
            await DBHelper().addData(invest);
          }
        }
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;

    setState(() {
      _loadingPath = false;
      print('_loadingPath  ' + _loadingPath.toString());
      _fileName = _path != null
          ? _path.split('/').last
          : _paths != null ? _paths.keys.toString() : '...';
      print('_path  ' + _path.toString());
      print('_filename  ' + _fileName.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            getAppBarUI(),
            Expanded(
                child: new Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: new SingleChildScrollView(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new SizedBox(
                      height: 24,
                    ),
                    new Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: ColorTheme.pale,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 8,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _openFileExplorer();
                          },
                          child: Center(
                            child: Text(
                              "Get import template to Assets",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 24,
                    ),
                    new Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: ColorTheme.pale,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 8,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _openFileExplorer();
                          },
                          child: Center(
                            child: Text(
                              "Choose your data to Assets",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 24,
                    ),
                    new Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: ColorTheme.pale,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 8,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _openFileExplorer();
                          },
                          child: Center(
                            child: Text(
                              "Get import template to Bill",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new SizedBox(
                      height: 24,
                    ),
                    new Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: ColorTheme.pale,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 8,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _openFileExplorer();
                          },
                          child: Center(
                            child: Text(
                              "Choose your data to Bill",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    new Builder(
                      builder: (BuildContext context) => _loadingPath
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: const CircularProgressIndicator())
                          : _path != null || _paths != null
                              ? new Container(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  child: new Scrollbar(
                                      child: new ListView.separated(
                                    itemCount:
                                        _paths != null && _paths.isNotEmpty
                                            ? _paths.length
                                            : 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final bool isMultiPath =
                                          _paths != null && _paths.isNotEmpty;
                                      final String name = 'File $index: ' +
                                          (isMultiPath
                                              ? _paths.keys.toList()[index]
                                              : _fileName ?? '...');
                                      final path = isMultiPath
                                          ? _paths.values
                                              .toList()[index]
                                              .toString()
                                          : _path;

                                      return new ListTile(
                                        title: new Text(
                                          name,
                                        ),
                                        subtitle: new Text(path),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            new Divider(),
                                  )),
                                )
                              : new Container(),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 4.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context, 'tabIconsList');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Data import',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }
}
