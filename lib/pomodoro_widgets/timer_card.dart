import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todoappu/data/timer_service.dart';
import 'package:todoappu/data/utils.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = (provider.currentDuration % 60);

    return Column(
      children: [
        Center(
          child: Text(provider.currentState + " TIME",
              style: textStyle(25, renderForestColor(provider.currentState),
                  FontWeight.w900)),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: MediaQuery.of(context).size.width / 3.2,
              decoration: BoxDecoration(
                color: renderForestColor(provider.currentState),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Text(
                  (provider.currentDuration ~/ 60).toString(),
                  style: textStyle(
                    50,
                    renderColor(provider.currentState),
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(':',
                style: textStyle(
                  60,
                  Color.fromARGB(255, 44, 44, 44),
                  FontWeight.bold,
                )),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: MediaQuery.of(context).size.width / 3.2,
              decoration: BoxDecoration(
                color: renderForestColor(provider.currentState),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Text(
                  seconds == 0
                      ? "${seconds.round()}0"
                      : seconds.round().toString(),
                  style: textStyle(
                    50,
                    renderColor(provider.currentState),
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
