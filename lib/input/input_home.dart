import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/input/invest_import_view.dart';
import 'package:vara/mine/settings/currency_view.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/common/app_common.dart';
import 'categroy.dart';
import 'package:vara/models/db_models.dart';

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
  String categroyTitle = S.current.Category;
  String categroy = S.current.Category;
  String categroyTitleValue = S.current.Category;
  String categroyValue = S.current.Category;
  IconData categroyIcon = FontAwesomeIcons.layerGroup;
  Color categroyTitleColor = ColorTheme.greyquadradarker;
  Color categroyColor = ColorTheme.grey;

  int mark = 0;
  String currencyValue = 'EUR';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: ColorTheme.white,
          elevation: 0,
          title: Text(S.current.NewTransaction, style: AppTheme.subPageTitle),
          leading: IconButton(
              icon: FaIcon(FontAwesomeIcons.times),
              iconSize: 20,
              color: ColorTheme.greytripledarker,
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.fileUpload,
                color: ColorTheme.greyquadradarker,
                size: 20,
              ),
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
                  //autofocus: true,
                  style: TextStyle(fontSize: 40),
                  cursorColor: Colors.red,
                  decoration: new InputDecoration(
                    icon: FaIcon(
                      FontAwesomeIcons.creditCard,
                      color: ColorTheme.greyquadradarker,
                      size: 18,
                    ),
                    hintText: "0.00",
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  keyboardAppearance: Brightness.light,
                  inputFormatters: [UsNumberTextInputFormatter()]),
            ),
            OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return CategroyView();
                  })).then((data) {
                    if (data != null) {
                      setState(() {
                        categroyTitle = data['title'];
                        categroyTitleValue = data['categroyValue'];
                        categroyTitleColor = data['color'];
                        categroyColor = data['color'];
                        categroyIcon = data['icon'];
                        categroy = data['categroy'];
                        categroyValue = data['value'];
                        mark = data['mark'];
                      });
                    }
                  });
                },
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 18),
                        child: FaIcon(
                          categroyIcon,
                          color: categroyTitleColor,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: Text(
                          categroyTitleValue,
                          style: setNoteTitleLighter(categroyTitleColor),
                        ),
                      ),
                    ],
                  ),
                  OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0)
                ])),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: FaIcon(
                      FontAwesomeIcons.poll,
                      color: categroyColor,
                      size: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 15),
                    child: Text(
                      categroyValue,
                      style: setNoteTitleLighter(categroyColor),
                    ),
                  ),
                ],
              ),
              OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0)
            ]),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return CurrencyView();
                  })).then((data) {
                    if (data != null) {
                      print(currencyValue);
                      setState(() {
                        currencyValue = data;
                      });
                      print(currencyValue);
                    }
                  });
                },
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: FaIcon(
                          FontAwesomeIcons.coins,
                          color: ColorTheme.greyquadradarker,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: Text(
                          currencyValue,
                          style:
                              setNoteTitleLighter(ColorTheme.greyquadradarker),
                        ),
                      ),
                    ],
                  ),
                  OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0)
                ])),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
              ),
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
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: FaIcon(
                              FontAwesomeIcons.solidCalendarAlt,
                              color: ColorTheme.greyquadradarker,
                              size: 20,
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Container(
                            alignment: Alignment(0, 0),
                            child: Text(
                              date,
                              style: setNoteTitleLighter(ColorTheme.greydarker),
                            ),
                          ),
                        ),
                      ],
                    )),
                OneHeightBorder(top: 20, left: 20, right: 20, bottom: 0)
              ]),
            ),
            Padding(
                padding: EdgeInsets.only(top: 60, left: 50, right: 50),
                child: InkWell(
                  onTap: () async {
                    if (moneyController.text == '' || categroy == '') {
                      var _alertDialog = AlertDialog(
                        title: Text(S.current.Alert),
                        content: Text(S.current.AlertNote),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(S.current.Confirm),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );

                      var isDismiss = await showDialog(
                          context: context,
                          builder: (context) {
                            return _alertDialog;
                          });
                      return isDismiss;
                    } else {
                      var providerData =
                          Provider.of<ProviderData>(context, listen: false);
                      Bill bill = new Bill();
                      bill.amount = double.parse(moneyController.text);
                      bill.date = date;
                      bill.currency = currencyValue;
                      bill.mark = mark;
                      bill.use = categroyTitle;
                      bill.categroy = categroy;

                      await providerData.insertBill(bill);
                      await providerData.getBillList();
                      await providerData.getAssetList();
                      Navigator.pop(context);
                    }
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
                      S.current.Save,
                      style: setNoteTitle(ColorTheme.white),
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
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

class CategroyChoiceData {
  IconData categroyIcon = FontAwesomeIcons.layerGroup;
  String categroyTitle = S.current.Category;
  Color color = ColorTheme.greyquadradarker;
  CategroyChoiceData({this.categroyIcon, this.categroyTitle, this.color});

  setDate(name, title, colors) {
    categroyIcon = name;
    categroyTitle = title;
    color = colors;
  }
}
