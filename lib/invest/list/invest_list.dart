import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vara/models/provider_data.dart';
import 'package:vara/utils/app_ui.dart';
import 'package:vara/utils/color_theme.dart';
import 'package:vara/utils/toolkit.dart';
import 'choice_bar.dart';
import 'invest_detail.dart';
import 'package:vara/utils/app_theme.dart';

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
          elevation: 0,
          title: Text('Invest List', style: AppTheme.titleText),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 20,
              color: ColorTheme.greytripledarker,
              onPressed: () {
                Navigator.pop(context);
              }),
          bottom: TabBar(
            isScrollable: true,
            labelColor: ColorTheme.greytripledarker,
            indicatorColor: ColorTheme.white,
            labelStyle: AppTheme.titleTextSmall,
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
                                padding: const EdgeInsets.only(top: 0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => InvestDetail(
                                                investdetail: invest),
                                          ));
                                    },
                                    child: InvestList(
                                      title1:
                                          formatNum(invest['investamount'], 2)
                                                  .toString() +
                                              ' ' +
                                              invest['currency'],
                                      title2: formatNum(invest['interest'], 2)
                                              .toString() +
                                          invest['currency'],
                                      title3: invest['investtime'],
                                      title4: invest['status'],
                                      title5: 'Status',
                                      title6: 'Interest',
                                      title7: 'Invest Time',
                                      title8: 'Invest Amount',
                                    ))));
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
                                child: InkWell(
                                    onTap: () {
                                      print("tapped on container" + '$index');
                                    },
                                    child: InvestList(
                                      title1: 'Invest Amount:  ' +
                                          formatNum(invest['investamount'], 2)
                                              .toString() +
                                          ' ' +
                                          invest['currency'],
                                      title2: formatNum(invest['interest'], 2)
                                              .toString() +
                                          invest['currency'],
                                      title3: invest['investtime'],
                                      title4: invest['status'],
                                      title5: '',
                                      title6: '',
                                      title7: '',
                                      title8: '',
                                    ))));
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
