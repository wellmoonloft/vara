import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/toolkit.dart';
import 'choice_bar.dart';

class InvestListView extends StatefulWidget {
  //final List<Map> investList;

  const InvestListView({Key key}) : super(key: key);
  @override
  InvestListState createState() => InvestListState();
}

class InvestListState extends State<InvestListView> {
  List<Map> current = List<Map>();
  List<Map> finished = List<Map>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<InvestData>(context).investList.forEach((element) {
      if (element['status'] != 'FINISHED') {
        current.add(element);
      } else {
        finished.add(element);
      }
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: ColorTheme.white,
          title: Text('Invest List',
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
          bottom: TabBar(
            isScrollable: true,
            labelColor: ColorTheme.greytripledarker,
            indicatorColor: ColorTheme.background,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: ColorTheme.greytripledarker,
            ),
            labelPadding: EdgeInsets.only(left: 20, right: 20),
            tabs: <Widget>[
              Tab(
                text: 'Current',
              ),
              Tab(
                text: 'Finished',
                //icon: Icon(Icons.directions_car),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: <Widget>[
                ChoiceBar(),
                Flexible(
                  child: ListView.builder(
                      itemCount: current.length,
                      itemBuilder: (BuildContext context, int index) {
                        var invest = current[index];
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 6, right: 6, top: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorTheme.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color:
                                              ColorTheme.grey.withOpacity(0.2),
                                          offset: Offset(1.1, 1.1),
                                          blurRadius: 10.0),
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 24,
                                            right: 24,
                                            top: 10,
                                            bottom: 4),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'amount:  ' +
                                                        formatNum(
                                                                invest[
                                                                    'investamount'],
                                                                2)
                                                            .toString() +
                                                        ' ' +
                                                        invest['currency'],
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      //fontFamily: AppTheme.fontName,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      letterSpacing: -0.2,
                                                      color:
                                                          ColorTheme.greydarker,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 5,
                                            bottom: 8),
                                        child: Container(
                                          height: 2,
                                          decoration: BoxDecoration(
                                            color: ColorTheme.background,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 24, right: 24, bottom: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        'interest',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          // fontFamily: AppTheme.fontName,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          letterSpacing: -0.2,
                                                          color: ColorTheme
                                                              .greydarker,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 6),
                                                        child: Text(
                                                          formatNum(
                                                                      invest[
                                                                          'interest'],
                                                                      2)
                                                                  .toString() +
                                                              invest[
                                                                  'currency'],
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            //fontFamily: AppTheme.fontName,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12,
                                                            color: ColorTheme
                                                                .grey
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'start-time',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      //fontFamily: AppTheme.fontName,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      letterSpacing: -0.2,
                                                      color:
                                                          ColorTheme.greydarker,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6),
                                                    child: Text(
                                                      invest['investtime'],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        //fontFamily: AppTheme.fontName,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: ColorTheme.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        'status',
                                                        style: TextStyle(
                                                          //fontFamily: AppTheme.fontName,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          letterSpacing: -0.2,
                                                          color: (invest[
                                                                      'status'] ==
                                                                  'CURRENT')
                                                              ? ColorTheme
                                                                  .neogreendarker
                                                              : ColorTheme
                                                                  .cantaloupedarker,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 6),
                                                        child: Text(
                                                          invest['status'],
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            //fontFamily: AppTheme.fontName,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12,
                                                            color: (invest[
                                                                        'status'] ==
                                                                    'CURRENT')
                                                                ? ColorTheme
                                                                    .neogreendarker
                                                                : ColorTheme
                                                                    .cantaloupedarker,
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
                                  ),
                                )));
                      }),
                )
              ],
            ),
            Column(
              children: <Widget>[
                ChoiceBar(),
                Flexible(
                  child: ListView.builder(
                      itemCount: finished.length,
                      itemBuilder: (BuildContext context, int index) {
                        var invest = finished[index];
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 6, right: 6, top: 6),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorTheme.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color:
                                              ColorTheme.grey.withOpacity(0.2),
                                          offset: Offset(1.1, 1.1),
                                          blurRadius: 10.0),
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 24,
                                            right: 24,
                                            top: 10,
                                            bottom: 4),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'amount:  ' +
                                                        formatNum(
                                                                invest[
                                                                    'investamount'],
                                                                2)
                                                            .toString() +
                                                        ' ' +
                                                        invest['currency'],
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      //fontFamily: AppTheme.fontName,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      letterSpacing: -0.2,
                                                      color:
                                                          ColorTheme.greydarker,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 5,
                                            bottom: 8),
                                        child: Container(
                                          height: 2,
                                          decoration: BoxDecoration(
                                            color: ColorTheme.background,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 24, right: 24, bottom: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        'interest',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          // fontFamily: AppTheme.fontName,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          letterSpacing: -0.2,
                                                          color: ColorTheme
                                                              .greydarker,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 6),
                                                        child: Text(
                                                          formatNum(
                                                                      invest[
                                                                          'interest'],
                                                                      2)
                                                                  .toString() +
                                                              invest[
                                                                  'currency'],
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                            //fontFamily: AppTheme.fontName,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12,
                                                            color: ColorTheme
                                                                .grey
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'start-time',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      //fontFamily: AppTheme.fontName,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      letterSpacing: -0.2,
                                                      color:
                                                          ColorTheme.greydarker,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6),
                                                    child: Text(
                                                      invest['investtime'],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        //fontFamily: AppTheme.fontName,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: ColorTheme.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        'status',
                                                        style: TextStyle(
                                                          //fontFamily: AppTheme.fontName,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16,
                                                          letterSpacing: -0.2,
                                                          color: ColorTheme
                                                              .greydarker,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 6),
                                                        child: Text(
                                                          invest['status'],
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              //fontFamily: AppTheme.fontName,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 12,
                                                              color: ColorTheme
                                                                  .neogreendarker),
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
                                  ),
                                )));
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
