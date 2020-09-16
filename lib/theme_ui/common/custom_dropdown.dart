import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vara/theme_ui/color_theme.dart';

class CustomDropdownView extends StatefulWidget {
  const CustomDropdownView(
      {Key key,
      this.initialStartDate,
      this.initialEndDate,
      this.onApplyClick,
      this.onCancelClick,
      this.barrierDismissible = true,
      this.isSingleDate = false,
      this.minimumDate,
      this.maximumDate,
      this.top,
      this.left})
      : super(key: key);

  final DateTime minimumDate;
  final DateTime maximumDate;
  final bool barrierDismissible;
  final bool isSingleDate;
  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final double top;
  final double left;
  final Function(DateTime, DateTime, DateTime, int) onApplyClick;

  final Function onCancelClick;
  @override
  _CustomDropdownViewState createState() => _CustomDropdownViewState();
}

class _CustomDropdownViewState extends State<CustomDropdownView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  DateTime startDate1;
  DateTime endDate1;
  String month = DateFormat('yyyy-MM').format(DateTime.now());
  bool timeMark1 = false;
  List<String> drop = ['ALL', 'CURRENT', 'LATE', 'FINISHED'];

  int hour = 12;
  int minute = 30;
  int second = 30;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: animationController.value,
            child: InkWell(
              // splashColor: Colors.transparent,
              // focusColor: Colors.transparent,
              // highlightColor: Colors.transparent,
              // hoverColor: Colors.transparent,
              onTap: () {
                if (widget.barrierDismissible) {
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  //color: ColorTheme.transparent,
                  child: Stack(fit: StackFit.loose, children: [
                    Positioned(
                        left: widget.left,
                        top: widget.top,
                        child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: ColorTheme.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Column(
                              children: [
                                Text('data'),
                                Text('data'),
                                Text('data'),
                                Text('data')
                              ],
                            )))
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
