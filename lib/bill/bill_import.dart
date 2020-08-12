import 'package:flutter/material.dart';
import 'package:vara/utils/app_theme.dart';
import 'package:vara/utils/app_ui.dart';
import '../utils/color_theme.dart';

class BillImportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: AppTheme.outboxpadding,
            child: Container(
              decoration: AppTheme.boxDecoration,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'IMPORT FROM XLSX',
                        style: AppTheme.titleTextSmallLighter,
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
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'You can import your bill use XLSX.',
                      style: AppTheme.titleTextSmallLighter,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: CustomButtom(
                        title: 'IMPORT',
                        color: ColorTheme.cantaloupe,
                        navigator: 'bill'),
                  )
                ],
              ),
            )));
  }
}
