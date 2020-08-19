import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:vara/input/import/invest_import_view.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';

import 'categroy.dart';

class InputHome extends StatefulWidget {
  const InputHome({Key key, this.animationController}) : super(key: key);
  final AnimationController animationController;
  @override
  _InputHomeState createState() => _InputHomeState();
}

class _InputHomeState extends State<InputHome> with TickerProviderStateMixin {
  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  String date = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  final moneyController = TextEditingController();
  final noteController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String moneyValue = 'EUR';
    return Container(
      color: ColorTheme.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: ColorTheme.white,
          elevation: 0,
          title: Text('New Transaction', style: AppTheme.titleText),
          leading: IconButton(
              icon: Icon(Icons.close),
              iconSize: 20,
              color: ColorTheme.greytripledarker,
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.account_balance),
            //   iconSize: 20,
            //   color: ColorTheme.greytripledarker,
            //   tooltip: 'Search',
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => InvestImportView()));
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.import_export),
              iconSize: 20,
              color: ColorTheme.greytripledarker,
              tooltip: 'Search',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InvestImportView()));
              },
            ),
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                  controller: moneyController,
                  autofocus: true,
                  style: TextStyle(fontSize: 40),
                  cursorColor: Colors.red,
                  decoration: new InputDecoration(
                    icon: Icon(Icons.attach_money),
                    hintText: "0.00",
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  keyboardAppearance: Brightness.light,
                  inputFormatters: [UsNumberTextInputFormatter()]),
            ),
            InkWell(
                onTap: () {
                  showGeneralDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(.5),
                      barrierDismissible: true,
                      barrierLabel: '33',
                      transitionDuration: Duration(milliseconds: 200),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return CategroyView();
                      });
                },
                child:
                    TransactionDetail(title: 'Category', icon: Icons.category)),
            Padding(
                padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                child: Column(children: [
                  TextField(
                    controller: noteController,
                    autofocus: true,
                    cursorColor: Colors.red,
                    decoration: new InputDecoration(
                      icon: Icon(
                        Icons.assessment,
                        color: ColorTheme.greydoubledarker,
                      ),
                      hintText: "Note",
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.multiline,
                    keyboardAppearance: Brightness.light,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: ColorTheme.pantone,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                  ),
                ])),
            Padding(
                padding: EdgeInsets.only(top: 8, left: 20, right: 20),
                child: Column(children: [
                  Row(children: [
                    Icon(Icons.account_balance_wallet,
                        color: ColorTheme.greydoubledarker),
                    Padding(
                        padding: EdgeInsets.only(left: 15),
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
                          items: <String>['EUR', 'CNY']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ))
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: ColorTheme.pantone,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                    ),
                  ),
                ])),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(children: [
                InkWell(
                    onTap: () async {
                      var result = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          initialDatePickerMode: DatePickerMode.day,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030));
                      if (result != null) {
                        setState(() {
                          date = DateFormat('yyyy-MM-dd')
                              .format(result)
                              .toString();
                        });
                      }
                      print('$result');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.date_range,
                            color: ColorTheme.greydoubledarker),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Container(
                            alignment: Alignment(0, 0),
                            child: Text(
                              date,
                              style: AppTheme.titleTextSmallLighter,
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      color: ColorTheme.pantone,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                ),
              ]),
            ),
            //TransactionDetail(title: 'Make recurring', icon: Icons.refresh),
            Padding(
                padding: EdgeInsets.only(top: 60, left: 50, right: 50),
                child: InkWell(
                  onTap: () {
                    print(moneyController.text);
                    print('Category');
                    print(noteController.text);
                    print(moneyValue);
                    print(date);
                  },
                  child: Container(
                    height: 40,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorTheme.pale,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: ColorTheme.grey,
                            offset: Offset(1.1, 1.1),
                            blurRadius: 8.0),
                        BoxShadow(
                            color: ColorTheme.white,
                            offset: Offset(-1.1, -1.1),
                            blurRadius: 8.0),
                      ],
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(color: ColorTheme.white, fontSize: 16),
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}

class TransactionDetail extends StatelessWidget {
  final String title;
  final IconData icon;

  const TransactionDetail({Key key, this.title, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Icon(icon, color: ColorTheme.greydoubledarker),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: ColorTheme.greydoubledarker,
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            color: ColorTheme.pantone,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
    ]);
  }
}

class UsNumberTextInputFormatter extends TextInputFormatter {
  static const defaultDouble = 0.001;
  static double strToFloat(String str, [double defaultValue = defaultDouble]) {
    try {
      return double.parse(str);
    } catch (e) {
      return defaultValue;
    }
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;
    int selectionIndex = newValue.selection.end;
    if (value == ".") {
      value = "0.";
      selectionIndex++;
    } else if (value != "" &&
        value != defaultDouble.toString() &&
        strToFloat(value, defaultDouble) == defaultDouble) {
      value = oldValue.text;
      selectionIndex = oldValue.selection.end;
    }
    return new TextEditingValue(
      text: value,
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
