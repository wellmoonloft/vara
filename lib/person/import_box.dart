import 'package:flutter/material.dart';

import 'package:vara/utils/app_theme.dart';
import 'package:vara/utils/color_theme.dart';

class ImportBoxView extends StatelessWidget {
  final String title;
  final String navigator;
  final Color color;

  const ImportBoxView({Key key, this.title, this.navigator, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
      //color: ColorTheme.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              title,
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
                      color: color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.6),
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

_navigateAndDisplaySelection(context, navigator) {
  print('object');
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
