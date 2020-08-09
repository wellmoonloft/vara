import 'package:flutter/material.dart';

import 'package:vara/utils/app_theme.dart';
import '../utils/color_theme.dart';
import 'import/import_view.dart';

class InvestImportView extends StatefulWidget {
  // final List<Map> investList;

  const InvestImportView({Key key}) : super(key: key);
  @override
  _InvestImportState createState() => _InvestImportState();
}

class _InvestImportState extends State<InvestImportView> {
  @override
  void initState() {
    super.initState();
  }

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
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorTheme.greydarker,
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
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: ColorTheme.greydarker,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: ColorTheme.cassislighter,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                      ),
                      child: Container(
                          height: 40,
                          width: 180,
                          child: Padding(
                              padding: EdgeInsets.all(8),
                              child: InkWell(
                                  onTap: () {
                                    _navigate(context);
                                  },
                                  child: Container(
                                    alignment: Alignment(0, 0),
                                    child: Text(
                                      'IMPORT',
                                      style: TextStyle(
                                        //fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
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

  _navigate(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImportView()),
    );
  }
}
