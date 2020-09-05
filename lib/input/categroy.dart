import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vara/generated/l10n.dart';
import 'package:vara/models/default_data.dart';
import 'package:vara/theme_ui/app_theme.dart';
import 'package:vara/theme_ui/color_theme.dart';
import 'package:vara/theme_ui/common/app_common.dart';

class CategroyView extends StatefulWidget {
  const CategroyView({Key key}) : super(key: key);

  @override
  _CategroyViewState createState() => _CategroyViewState();
}

class _CategroyViewState extends State<CategroyView>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          //backgroundColor: ColorTheme.white,
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: ColorTheme.white.withOpacity(0.4),
            elevation: 0,
            title: Text(S.current.Category, style: AppTheme.subPageTitle),
            leading: IconButton(
                icon: FaIcon(FontAwesomeIcons.times),
                color: ColorTheme.greytripledarker,
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: <Widget>[
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.edit,
                  size: 20,
                ),
                color: ColorTheme.greytripledarker,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => InvestImportView()));
                },
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 20,
                ),
                color: ColorTheme.greytripledarker,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => InvestImportView()));
                },
              ),
            ],
            bottom: new TabBar(
              indicatorColor: ColorTheme.boxbackground,
              labelColor: ColorTheme.greydoubledarker,
              tabs: <Widget>[
                new Tab(
                  text: S.current.Expenses,
                ),
                new Tab(
                  text: S.current.Income,
                ),
                new Tab(
                  text: S.current.Savings,
                ),
              ],
              controller: _tabController,
            ),
          ),
          body: Container(
            color: ColorTheme.white.withOpacity(0.5),
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Expenses(),
                Income(),
                Savings(),
              ],
            ),
          )),
    );
  }
}

class Expenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategroyData miscellaneousData = CategroyData(
        iconList: <CategroyIcon>[
          CategroyIcon(
              icon: FontAwesomeIcons.university,
              title: 'Bank cost',
              value: S.current.BankCost),
          CategroyIcon(
              icon: FontAwesomeIcons.tshirt,
              title: 'Clothes',
              value: S.current.Clothes),
          CategroyIcon(
              icon: FontAwesomeIcons.heart,
              title: 'Healthcare',
              value: S.current.Healthcare),
          CategroyIcon(
              icon: FontAwesomeIcons.graduationCap,
              title: 'Student loan',
              value: S.current.StudentLoan),
        ],
        categroyTitle: 'MisCellaneous',
        categroyValue: S.current.MisCellaneous,
        color: ColorTheme.greylighter);
    CategroyData entertainmentData = CategroyData(
        iconList: <CategroyIcon>[
          CategroyIcon(
              icon: FontAwesomeIcons.bowlingBall,
              title: 'Bowling',
              value: S.current.Bowling),
          CategroyIcon(
              icon: FontAwesomeIcons.film,
              title: 'Cinema',
              value: S.current.Cinema),
          CategroyIcon(
              icon: FontAwesomeIcons.bolt,
              title: 'Electronics',
              value: S.current.Electronics),
          CategroyIcon(
              icon: FontAwesomeIcons.umbrellaBeach,
              title: 'Vacation',
              value: S.current.Vacation),
          CategroyIcon(
              icon: FontAwesomeIcons.dumbbell,
              title: 'Gym',
              value: S.current.Gym),
          CategroyIcon(
              icon: FontAwesomeIcons.pinterest,
              title: 'Hobby',
              value: S.current.Hobby),
          CategroyIcon(
              icon: FontAwesomeIcons.beer,
              title: 'Nightclub',
              value: S.current.Nightclub),
          CategroyIcon(
              icon: FontAwesomeIcons.futbol,
              title: 'Sports',
              value: S.current.Sports),
          CategroyIcon(
              icon: FontAwesomeIcons.youtubeSquare,
              title: 'Subscription',
              value: S.current.Subscription),
        ],
        categroyTitle: 'Entertainment',
        categroyValue: S.current.Entertainment,
        color: ColorTheme.cassis);
    CategroyData foodData = CategroyData(
        iconList: <CategroyIcon>[
          CategroyIcon(
              icon: FontAwesomeIcons.candyCane,
              title: 'Candy',
              value: S.current.Candy),
          CategroyIcon(
              icon: FontAwesomeIcons.coffee,
              title: 'Coffee',
              value: S.current.Coffee),
          CategroyIcon(
              icon: FontAwesomeIcons.cocktail,
              title: 'Drinks',
              value: S.current.Drinks),
          CategroyIcon(
              icon: FontAwesomeIcons.utensils,
              title: 'Restaurant',
              value: S.current.Restaurant),
          CategroyIcon(
              icon: FontAwesomeIcons.shoppingBag,
              title: 'Groceries',
              value: S.current.Groceries),
        ],
        categroyTitle: 'FoodDrinks',
        categroyValue: S.current.FoodDrinks,
        color: ColorTheme.neogreenlighter);
    CategroyData housingData = CategroyData(
        iconList: <CategroyIcon>[
          CategroyIcon(
              icon: FontAwesomeIcons.bolt,
              title: 'Electricity',
              value: S.current.Electricity),
          CategroyIcon(
              icon: FontAwesomeIcons.home,
              title: 'Housing',
              value: S.current.Housing),
          CategroyIcon(
              icon: FontAwesomeIcons.heart,
              title: 'Insurance',
              value: S.current.Insurance),
          CategroyIcon(
              icon: FontAwesomeIcons.wifi,
              title: 'Internet',
              value: S.current.Internet),
          CategroyIcon(
              icon: FontAwesomeIcons.moneyBill,
              title: 'Loan',
              value: S.current.Loan),
          CategroyIcon(
              icon: FontAwesomeIcons.hammer,
              title: 'Maintenance',
              value: S.current.Maintenance),
          CategroyIcon(
              icon: FontAwesomeIcons.university,
              title: 'Rent',
              value: S.current.Rent),
          CategroyIcon(
              icon: FontAwesomeIcons.tv, title: 'TV', value: S.current.TV),
          CategroyIcon(
              icon: FontAwesomeIcons.mobileAlt,
              title: 'Telephone',
              value: S.current.Telephone),
          CategroyIcon(
              icon: FontAwesomeIcons.water,
              title: 'Water',
              value: S.current.Water),
        ],
        categroyTitle: 'Housing',
        categroyValue: S.current.Housing,
        color: ColorTheme.mellowyellow);
    CategroyData lifestyleData = CategroyData(
        iconList: <CategroyIcon>[
          CategroyIcon(
              icon: FontAwesomeIcons.baby,
              title: 'Child care',
              value: S.current.ChildCare),
          CategroyIcon(
              icon: FontAwesomeIcons.tooth,
              title: 'Dentist',
              value: S.current.Dentist),
          CategroyIcon(
              icon: FontAwesomeIcons.heart,
              title: 'Doctor',
              value: S.current.Doctor),
          CategroyIcon(
              icon: FontAwesomeIcons.gift,
              title: 'Gift',
              value: S.current.Gift),
          CategroyIcon(
              icon: FontAwesomeIcons.hotel,
              title: 'Hotel',
              value: S.current.Hotel),
          CategroyIcon(
              icon: FontAwesomeIcons.star,
              title: 'Lifestyle',
              value: S.current.Lifestyle),
          CategroyIcon(
              icon: FontAwesomeIcons.paw, title: 'Pet', value: S.current.Pet),
          CategroyIcon(
              icon: FontAwesomeIcons.capsules,
              title: 'Pharmacy',
              value: S.current.Pharmacy),
        ],
        categroyTitle: 'Lifestyle',
        categroyValue: S.current.Lifestyle,
        color: ColorTheme.cantaloupelighter);
    CategroyData transportationData = CategroyData(
        iconList: <CategroyIcon>[
          CategroyIcon(
              icon: FontAwesomeIcons.carCrash,
              title: 'Car insurance',
              value: S.current.CarInsurance),
          CategroyIcon(
              icon: FontAwesomeIcons.car,
              title: 'Car Ioan',
              value: S.current.CarIoan),
          CategroyIcon(
              icon: FontAwesomeIcons.plane,
              title: 'Flight',
              value: S.current.Flight),
          CategroyIcon(
              icon: FontAwesomeIcons.gasPump,
              title: 'Gas',
              value: S.current.Gas),
          CategroyIcon(
              icon: FontAwesomeIcons.parking,
              title: 'Parking',
              value: S.current.Parking),
          CategroyIcon(
              icon: FontAwesomeIcons.subway,
              title: 'Public transport',
              value: S.current.PublicTransport),
          CategroyIcon(
              icon: FontAwesomeIcons.tools,
              title: 'Repair',
              value: S.current.Repair),
          CategroyIcon(
              icon: FontAwesomeIcons.taxi,
              title: 'Taxi',
              value: S.current.Taxi),
          CategroyIcon(
              icon: FontAwesomeIcons.tram,
              title: 'Transportation',
              value: S.current.Transportation),
        ],
        categroyTitle: 'Transportation',
        categroyValue: S.current.Transportation,
        color: ColorTheme.pale);
    return ListView(padding: const EdgeInsets.only(top: 20.0), children: [
      SizedBox(
        height: 10,
      ),
      GridTitle(
        icons: miscellaneousData.iconList,
        title: miscellaneousData.categroyTitle,
        color: miscellaneousData.color,
        value: miscellaneousData.categroyValue,
        mark: 0,
      ),
      GridTitle(
        icons: entertainmentData.iconList,
        title: entertainmentData.categroyTitle,
        color: entertainmentData.color,
        value: entertainmentData.categroyValue,
        mark: 0,
      ),
      GridTitle(
        icons: foodData.iconList,
        title: foodData.categroyTitle,
        color: foodData.color,
        value: foodData.categroyValue,
        mark: 0,
      ),
      GridTitle(
        icons: housingData.iconList,
        title: housingData.categroyTitle,
        color: housingData.color,
        value: housingData.categroyValue,
        mark: 0,
      ),
      GridTitle(
        icons: lifestyleData.iconList,
        title: lifestyleData.categroyTitle,
        color: lifestyleData.color,
        value: lifestyleData.categroyValue,
        mark: 0,
      ),
      GridTitle(
        icons: transportationData.iconList,
        title: transportationData.categroyTitle,
        color: transportationData.color,
        value: transportationData.categroyValue,
        mark: 0,
      )
    ]);
  }
}

class Income extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategroyData incomeData = CategroyData(
        iconList: <CategroyIcon>[
          CategroyIcon(
              icon: FontAwesomeIcons.child,
              title: 'Child benefit',
              value: S.current.ChildBenefit),
          CategroyIcon(
              icon: FontAwesomeIcons.moneyBillAlt,
              title: 'Income',
              value: S.current.Income),
          CategroyIcon(
              icon: FontAwesomeIcons.university,
              title: 'Interest',
              value: S.current.Interest),
          CategroyIcon(
              icon: FontAwesomeIcons.fileAlt,
              title: 'Investment',
              value: S.current.Investment),
          CategroyIcon(
              icon: FontAwesomeIcons.userShield,
              title: 'Pension',
              value: S.current.Pension),
          CategroyIcon(
              icon: FontAwesomeIcons.handHoldingUsd,
              title: 'Salary',
              value: S.current.Salary),
        ],
        categroyTitle: 'Income',
        categroyValue: S.current.Income,
        color: ColorTheme.neogreendarker);
    return ListView(padding: const EdgeInsets.only(top: 20.0), children: [
      SizedBox(
        height: 10,
      ),
      GridTitle(
        icons: incomeData.iconList,
        title: incomeData.categroyTitle,
        color: incomeData.color,
        value: incomeData.categroyValue,
        mark: 1,
      )
    ]);
  }
}

class Savings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategroyData savingsData = CategroyData(
        iconList: <CategroyIcon>[
          CategroyIcon(
              icon: FontAwesomeIcons.star,
              title: 'Emergency savings',
              value: S.current.EmergencySavings),
          CategroyIcon(
              icon: FontAwesomeIcons.piggyBank,
              title: 'Savings',
              value: S.current.Savings),
          CategroyIcon(
              icon: FontAwesomeIcons.umbrellaBeach,
              title: 'Vacation savings',
              value: S.current.VacationSavings),
        ],
        categroyTitle: 'Savings',
        categroyValue: S.current.Savings,
        color: ColorTheme.cassisdarker);
    return ListView(padding: const EdgeInsets.only(top: 20.0), children: [
      SizedBox(
        height: 10,
      ),
      GridTitle(
        icons: savingsData.iconList,
        title: savingsData.categroyTitle,
        color: savingsData.color,
        value: savingsData.categroyValue,
        mark: 2,
      )
    ]);
  }
}

class GridTitle extends StatefulWidget {
  final List<CategroyIcon> icons;
  final String title;
  final Color color;
  final String value;
  final int mark;
  GridTitle({this.icons, this.title, this.color, this.mark, this.value});

  _GridTitleState createState() => _GridTitleState();
}

class _GridTitleState extends State<GridTitle> {
  bool mark = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.value,
                      textAlign: TextAlign.left,
                      style: setNoteTitleLighter(ColorTheme.greydarker)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        mark = !mark;
                      });
                    },
                    child: FaIcon(
                      mark ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                      size: 16,
                      color: ColorTheme.greydoubledarker,
                    ),
                  )
                ])),
        OneHeightBorder(left: 20, right: 20, top: 5, bottom: 20),
        mark
            ? IconGridView(
                icons: widget.icons,
                color: widget.color,
                title: widget.title,
                value: widget.value,
                mark: widget.mark,
              )
            : Container()
      ],
    );
  }
}

class IconGridView extends StatelessWidget {
  final List<CategroyIcon> icons;
  final String title;
  final Color color;
  final String value;
  final int mark;

  IconGridView({this.icons, this.color, this.title, this.mark, this.value});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1.0),
        itemCount: icons.length,
        physics: new NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  //print(icons[index].title);
                  //var data = Map();
                  var data = {
                    'title': icons[index].title,
                    'categroyValue': icons[index].value,
                    'color': color,
                    'icon': icons[index].icon,
                    'categroy': title,
                    'value': value,
                    'mark': mark
                  };
                  Navigator.of(context).pop(data);
                },
                child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: FaIcon(
                      icons[index].icon,
                      color: ColorTheme.white,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  icons[index].value,
                  textAlign: TextAlign.center,
                  style: setNoteTitleSmall(color),
                ),
              )
            ],
          );
        });
  }
}
