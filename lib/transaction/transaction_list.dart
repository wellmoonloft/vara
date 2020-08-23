import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vara/generated/l10n.dart';
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
  List<Map> current = List<Map>();
  List<Map> later = List<Map>();
  List<Map> finished = List<Map>();
  List<Bill> billList;
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
    billList = Provider.of<ProviderData>(context).billList;
    // if (billList != null) {
    //   billList.forEach((element) {
    //     current.add(element);
    //   });
    // }
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
                                // if (newValue == 'ALL') {
                                //   setState(() {
                                //     current.clear();
                                //     print(current.length);
                                //     countryValue = newValue;
                                //     if (billList != null) {
                                //       billList.forEach((element) {
                                //         current.add(element);
                                //       });
                                //     }
                                //   });
                                // } else if (newValue == 'CURRENT') {
                                //   setState(() {
                                //     current.clear();
                                //     print(current.length);
                                //     countryValue = newValue;
                                //     if (billList != null) {
                                //       billList.forEach((element) {
                                //         if (element['status'] == 'CURRENT') {
                                //           current.add(element);
                                //         }
                                //       });
                                //     }
                                //   });
                                // } else {
                                //   setState(() {
                                //     current.clear();
                                //     print(current.length);
                                //     countryValue = newValue;
                                //     if (billList != null) {
                                //       billList.forEach((element) {
                                //         if (element['status'] == 'LATE') {
                                //           current.add(element);
                                //         }
                                //       });
                                //       print(current.length);
                                //     }
                                //   });
                                // }
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
              itemCount: billList.length,
              itemBuilder: (BuildContext context, int index) {
                var bill = billList[index];
                return Dismissible(
                    key: Key('key${billList[index]}'),
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
                        title: Text('Alert'),
                        content: Text(
                            'Confirm delete Bill:${bill.amount} ${bill.use}？'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          FlatButton(
                            child: Text("Delete"),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content:
                                      Text("${billList[index]} dismissed")));
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
                            padding: const EdgeInsets.only(top: 0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: AppTheme.inboxpadding,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              S.current.Date,
                                              style: AppTheme.subtitleText,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 6, bottom: 6),
                                              child: Text(
                                                bill.date,
                                                style: AppTheme
                                                    .titleTextSmallLighter,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Use',
                                                  style: AppTheme.subtitleText,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          3 -
                                                      16,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 6, bottom: 6),
                                                  child: Text(
                                                    bill.use,
                                                    softWrap: true,
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: AppTheme
                                                        .titleTextSmallLighter,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  S.current.Amount,
                                                  style: AppTheme.subtitleText,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          3 -
                                                      16,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 6, bottom: 6),
                                                  child: Text(
                                                    (bill.mark == 0
                                                            ? '-'
                                                            : '+') +
                                                        NumberFormat(
                                                                "###,###.0#",
                                                                "en_US")
                                                            .format(
                                                                bill.amount) +
                                                        bill.currency,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color: (bill.mark == 0)
                                                          ? ColorTheme.darkred
                                                          : ColorTheme
                                                              .neogreendarker,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
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
}
