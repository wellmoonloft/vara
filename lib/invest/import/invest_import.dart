import 'package:flutter/material.dart';

import 'package:vara/utils/app_theme.dart';
import '../../utils/color_theme.dart';
import 'import_list.dart';

class InvestImportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.only(
                left: AppTheme.leftRightPadding,
                right: AppTheme.leftRightPadding,
                top: 18,
                bottom: 20),
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
                      color: ColorTheme.grey.withOpacity(0.2),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'IMPORT FROM XLSX',
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorTheme.greydoubledarker,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/Icons/xlsx.png'),
                        ),
                      ),
                      child: SizedBox(
                        height: 65,
                        width: 65,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'You can import your bill use XLSX.',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorTheme.greydoubledarker,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: ColorTheme.cassislighter,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                            topRight: Radius.circular(30.0)),
                      ),
                      child: Container(
                          height: 45,
                          width: 200,
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                  onTap: () {
                                    //_navigateAndDisplaySelection(context);
                                    showGeneralDialog(
                                        context: context,
                                        barrierColor:
                                            Colors.black.withOpacity(.5),
                                        barrierDismissible: true,
                                        barrierLabel: '',
                                        transitionDuration:
                                            Duration(milliseconds: 250),
                                        transitionBuilder:
                                            (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation,
                                                Widget child) {
                                          return ScaleTransition(
                                              scale: animation, child: child);
                                        },
                                        pageBuilder: (BuildContext context,
                                            Animation<double> animation,
                                            Animation<double>
                                                secondaryAnimation) {
                                          return Center(
                                            child: InvestImportList(),
                                          );
                                        });
                                  },
                                  child: Container(
                                    alignment: Alignment(0, 0),
                                    child: Text(
                                      'IMPORT',
                                      style: TextStyle(
                                        //fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        letterSpacing: 1.2,
                                        color: ColorTheme.white,
                                      ),
                                    ),
                                  )))),
                    ),
                  )
                ],
              ),
            )));
  }
}
