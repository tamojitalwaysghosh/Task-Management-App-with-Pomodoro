import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todoappu/data/timer_service.dart';
import 'package:todoappu/data/utils.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Container(
      width: MediaQuery.of(context).size.width / 1.8,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "ROUND",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: 'Comfortaa'),
              ),
              //Text("GOAL",
              //  style: textStyle(25, Colors.grey[350], FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${provider.rounds}/4",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    fontFamily: 'Comfortaa'),
              ),
              // Text("${provider.goal}/5",
              //   style: textStyle(30, Colors.grey[350], FontWeight.bold)),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: renderForestColor(provider.currentState),
        borderRadius: BorderRadius.circular(35),
      ),
    );
  }
}
