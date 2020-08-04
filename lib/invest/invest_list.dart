import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vara/utils/color_theme.dart';

class InvestListView extends StatefulWidget {
  @override
  InvestListState createState() => InvestListState();
}

class InvestListState extends State<InvestListView> {
  int perPage = 10;
  int present = 0; //10
  List<String> originalItems = List<String>.generate(10000, (i) => "Item $i");
  List<String> items = List<String>();
  String date = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  String dropdownValue = 'One';

  @override
  void initState() {
    super.initState();
    setState(() {
      items.addAll(originalItems.getRange(present, present + perPage));
      present = present + perPage;
    });
  }

  void loadMore() {
    setState(() {
      if ((present + perPage) > originalItems.length) {
        items.addAll(originalItems.getRange(present, originalItems.length));
      } else {
        items.addAll(originalItems.getRange(present, present + perPage));
      }
      present = present + perPage;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Row(
                  children: <Widget>[
                    RaisedButton(
                      color: ColorTheme.white,
                      child: Text(date),
                      onPressed: () async {
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
                    ),
                    DropdownButton<String>(
                      dropdownColor: ColorTheme.white,
                      //focusColor: ColorTheme.black,
                      value: dropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Flexible(
                  child: NotificationListener<ScrollNotification>(
                    // ignore: missing_return
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                        loadMore();
                      }
                    },
                    child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return (index == items.length)
                            ? Container(
                                alignment: Alignment.center,
                                color: ColorTheme.background,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: CircularProgressIndicator(
                                        backgroundColor: ColorTheme.background,
                                        valueColor: AlwaysStoppedAnimation(
                                            ColorTheme.puristbluedarker),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text('Load More ...',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: ColorTheme.greydoubledarker,
                                        ))
                                  ],
                                ))
                            : Container(
                                alignment: Alignment.center,
                                color: ColorTheme.background,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text('${items[index]}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: ColorTheme.greydoubledarker,
                                        ))
                                  ],
                                ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                      itemCount: (present <= originalItems.length)
                          ? items.length + 1
                          : items.length,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //Icon(choice.icon, size: 128.0, color: textStyle.color),
                      Text('choice.title',
                          style: Theme.of(context).textTheme.headline4),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
