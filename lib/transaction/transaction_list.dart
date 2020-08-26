import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/default_data.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/models/db_models.dart';

class BillListView extends StatefulWidget {
  //final List<Map> investList;

  const BillListView({Key key}) : super(key: key);
  @override
  BillListState createState() => BillListState();
}

class BillListState extends State<BillListView> {
  List<Bill> current = List<Bill>();
  List<Map> later = List<Map>();
  List<Map> finished = List<Map>();
  List<Bill> billList;
  String date = DateFormat('yyyy-MM').format(DateTime.now()).toString();
  String moneyValue = 'ALL';
  String termValue = 'ALL';
  String countryValue = 'ALL';
  String currencyValue = 'EUR';
  var items = List<DropdownMenuItem<String>>();
  bool mark = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    billList = Provider.of<ProviderData>(context).billList;
    List<CurrencyData> currencyData =
        Provider.of<ProviderData>(context).currencyData;
    if (billList != null) {
      if (mark) {
        billList.forEach((element) {
          current.add(element);
        });
        mark = false;
      }
    }

    if (currencyData != null && items.length == 0) {
      for (var i = 0; i < currencyData.length; i++) {
        items.add(DropdownMenuItem(
            child: Text(
              currencyData[i].short,
            ),
            value: currencyData[i].short));
      }
    }
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: ColorTheme.white,
        elevation: 0,
        title: Text(S.current.TransactionList, style: AppTheme.titleText),
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
                            S.current.Date,
                            textAlign: TextAlign.center,
                            style: AppTheme.subtitleText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            S.current.Category,
                            textAlign: TextAlign.center,
                            style: AppTheme.subtitleText,
                          ),
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
                                  chooseDate(date, currencyValue);
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
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment(0, 0),
                              child: DropdownButton<String>(
                                dropdownColor: ColorTheme.white,
                                iconSize: 16,
                                underline: Container(),
                                value: currencyValue,
                                onChanged: (String newValue) async {
                                  setState(() {
                                    currencyValue = newValue;
                                  });
                                  chooseDate(date, newValue.toString());
                                },
                                items: items,
                              )),
                        ),
                      ],
                    )
                  ])),
          Flexible(
            child: ListView.separated(
              itemCount: billList.length,
              itemBuilder: (BuildContext context, int index) {
                var bill = billList[index];
                return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) async {
                      setState(() {
                        billList.removeAt(index);
                      });
                      var providerData =
                          Provider.of<ProviderData>(context, listen: false);
                      await providerData.deleteBill(bill);
                      await providerData.getBillList();
                      await providerData.getAssetList();
                    },
                    confirmDismiss: (direction) async {
                      var _alertDialog = AlertDialog(
                        title: Text(S.current.Alert),
                        content:
                            Text(S.current.ConfirmNote(bill.amount, bill.use)),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(S.current.Cancel),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          FlatButton(
                            child: Text(S.current.Delete),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      S.current.DeleteNote(billList[index]))));
                            },
                          ),
                        ],
                      );

                      var isDismiss = await showDialog(
                          context: context,
                          builder: (context) {
                            return _alertDialog;
                          });
                      return isDismiss;
                    },
                    background: Container(
                      width: 50,
                      color: Colors.red,
                      child: ListTile(
                        trailing: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Container(
                        color: ColorTheme.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                            padding: AppTheme.inboxpadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          (bill.mark == 0 ? '-' : '+') +
                                              NumberFormat(
                                                      "###,###.0#", "en_US")
                                                  .format(bill.amount) +
                                              bill.currency,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: (bill.mark == 0)
                                                ? ColorTheme.darkred
                                                : ColorTheme.neogreendarker,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: Text(
                                          bill.categroy + ' | ' + bill.use,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppTheme.subtitleText,
                                        ),
                                      ),
                                    ]),
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 6, bottom: 6),
                                  child: Text(
                                    bill.date,
                                    style: AppTheme.titleTextSmallLighterS,
                                  ),
                                ),
                              ],
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

  chooseDate(_date, _currency) {
    setState(() {
      current.clear();
      if (billList != null) {
        billList.forEach((element) {
          if (element.date.substring(0, 7) == _date) {
            if (element.currency == _currency) {
              current.add(element);
            }
          }
        });
      }
    });
  }
}
