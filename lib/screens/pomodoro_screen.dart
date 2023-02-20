import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoappu/data/timer_service.dart';
import 'package:todoappu/data/utils.dart';
import 'package:todoappu/pomodoro_widgets/progress_widget.dart';
import 'package:todoappu/pomodoro_widgets/time_conteroller.dart';
import 'package:todoappu/pomodoro_widgets/time_options.dart';
import 'package:todoappu/pomodoro_widgets/timer_card.dart';
import 'package:todoappu/screens/about_p.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      body: SingleChildScrollView(
          // controller: controller,
          child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AboutPomodoro())),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Container(
                          padding: EdgeInsets.all(8.6),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 13, 71, 161),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                // spreadRadius: 4,
                                blurRadius: 4,
                                offset: Offset(0, 0),
                              )
                            ],
                          ),
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                              //borderRadius: BorderRadius.circular(15.0),
                              child: Icon(
                            Icons.question_mark,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                    Text(
                      "Pomodoro Mode",
                      style: TextStyle(
                          color: Color.fromARGB(255, 44, 44, 44),
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          fontFamily: 'Comfortaa'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<TimerService>(context, listen: false)
                            .reset();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Container(
                          padding: EdgeInsets.all(8.6),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 13, 71, 161),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                // spreadRadius: 4,
                                blurRadius: 4,
                                offset: Offset(0, 0),
                              )
                            ],
                          ),
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                              //borderRadius: BorderRadius.circular(15.0),
                              child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 248, 248),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            /*SizedBox(
              height: 15,
            ),
            Text(
              "Set Timer:",
              style: TextStyle(
                  color: Color.fromARGB(255, 44, 44, 44),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: 'Comfortaa'),
            ),*/
            SizedBox(
              height: 25,
            ),
            TimeOptions(),
            SizedBox(
              height: 30,
            ),
            TimerCard(),
            SizedBox(
              height: 30,
            ),
            TimeController(),
            SizedBox(
              height: 35,
            ),
            ProgressWidget(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}
