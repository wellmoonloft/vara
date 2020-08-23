import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/models/db_models.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/progress_dialog.dart';

class InvestImportView extends StatefulWidget {
  const InvestImportView({Key key}) : super(key: key);
  @override
  _ImportViewState createState() => _ImportViewState();
}

class _ImportViewState extends State<InvestImportView> {
  String _path;
  String _extension;
  FileType _pickingType = FileType.any;
  List<dynamic> dropdownmenu = List(10);
  List right = [
    'Invest Code',
    'Invest Amount',
    'Invest Time',
    'Per Time',
    'Payment Time',
    'Received',
    'Invest Type',
    'Status',
    'Currency',
    'Country',
  ];

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

                if (cell.colIndex == int.parse(dropdownmenu[0])) {
                  invest.code = val.toString();
                } else if (cell.colIndex == int.parse(dropdownmenu[1])) {
                  invest.amount = val;
                } else if (cell.colIndex == int.parse(dropdownmenu[2])) {
                  invest.date = val.toString();
                } else if (cell.colIndex == int.parse(dropdownmenu[3])) {
                  invest.perDate = val.toString();
                } else if (cell.colIndex == int.parse(dropdownmenu[4])) {
                  invest.endDate = val.toString();
                } else if (cell.colIndex == int.parse(dropdownmenu[5])) {
                  invest.received = val;
                } else if (cell.colIndex == int.parse(dropdownmenu[6])) {
                  invest.type = val.toString();
                } else if (cell.colIndex == int.parse(dropdownmenu[7])) {
                  invest.status = val.toString();
                } else if (cell.colIndex == int.parse(dropdownmenu[8])) {
                  invest.currency = val.toString();
                } else if (cell.colIndex == int.parse(dropdownmenu[9])) {
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
        if (items.length == 0) {
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
              title: Text(S.current.Import, style: AppTheme.titleText),
              leading: BackButton(
                  color: ColorTheme.greytripledarker,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              elevation: 0.0,
            ),
            backgroundColor: Colors.transparent,
            body: ListView.builder(
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: InkWell(
                          onTap: () {
                            ProgressDialog.showProgress(context);
                            save();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: FaIcon(
                              FontAwesomeIcons.solidFileExcel,
                              color: ColorTheme.neogreendarker,
                              size: 60,
                            ),
                          )),
                    );
                  } else if (index == 1) {
                    return Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 10),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            S.current.ImportNote,
                            style: AppTheme.titleTextSmallLighter,
                          ),
                        ));
                  } else {
                    return Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  dropdownColor: ColorTheme.white,
                                  iconSize: 18,
                                  isExpanded: true,
                                  value: dropdownmenu[index - 2],
                                  isDense: false,
                                  hint: Text(hintText),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownmenu[index - 2] = newValue;
                                    });
                                  },
                                  items: items,
                                ),
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '=>',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: ColorTheme.puristbluedarker,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text(
                                right[index - 2],
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: AppTheme.titleTextSmall,
                              ),
                            )),
                      ],
                    );
                  }
                })));
  }
}
