import 'package:flutter/material.dart';
import 'package:vara/utils/app_theme.dart';
import 'package:vara/utils/color_theme.dart';

class DecoratedButtom extends StatelessWidget {
  final String title;
  final String navigator;
  final Color color;

  const DecoratedButtom({Key key, this.title, this.navigator, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'data',
            style: AppTheme.titleTextSmall,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: ColorTheme.transparent,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorTheme.cantaloupelighter.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: ColorTheme.cantaloupe.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () {
                            _navigateAndDisplaySelection(context, navigator);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

_navigateAndDisplaySelection(context, navigator) {
  if (navigator == 'invest') {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => InvestImportView()),
    // );
  } else if (navigator == 'bill') {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => new BillImportView()),
    // );
  } else {}
}
