import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todoappu/data/timer_service.dart';
import 'package:todoappu/data/utils.dart';

class TimeOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    //double selectedTime = 1500;
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 105),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: selectableTimes.map((time) {
        return InkWell(
          onTap: (() => provider.selectTime(double.parse(time))),
          child: Container(
            margin: EdgeInsets.only(left: 10),
            width: int.parse(time) == provider.selectedTime ? 90 : 50,
            height: int.parse(time) == provider.selectedTime ? 60 : 50,
            decoration: int.parse(time) == provider.selectedTime
                ? BoxDecoration(
                    color: renderForestColor(provider.currentState),
                    border: Border.all(
                        width: 3,
                        color: renderForestColor(provider.currentState)),
                    borderRadius: BorderRadius.circular(15))
                : BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(136, 69, 69, 69)),
                    borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: int.parse(time) == provider.selectedTime
                  ? Text(
                      (int.parse(time) ~/ 60).toString(),
                      style: textStyle(25, renderColor(provider.currentState),
                          FontWeight.w700),
                    ) //~ is for float division to divide the converted string to int
                  : Text(
                      (int.parse(time) ~/ 60).toString(),
                      style: textStyle(
                          17, Color.fromARGB(135, 27, 26, 26), FontWeight.w700),
                    ),
            ),
          ),
        );
      }).toList()), //always use .toList() whenever using map
    );
  }
}
