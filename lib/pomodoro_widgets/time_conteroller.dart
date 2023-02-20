import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoappu/data/timer_service.dart';
import 'package:todoappu/data/utils.dart';

class TimeController extends StatelessWidget {
  const TimeController({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[300],
        // backgroundBlendMode: BlendMode.dst,

        // shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: provider.timerPlaying
            ? Icon(Icons.pause)
            : Icon(Icons.play_arrow_sharp),
        iconSize: 55,
        color: renderForestColor(provider.currentState),
        onPressed: () {
          if (provider.timerPlaying) {
            Provider.of<TimerService>(context, listen: false).pause();
          } else {
            Provider.of<TimerService>(context, listen: false).start();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Container(
                      //margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 300,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: ClipRRect(
                                  //borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/abstract-877.gif'),
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Pomodoro Started!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25,
                                      fontFamily: 'Comfortaa'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Your Pomodoro session has started, we wish you a good luck in this journey.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(

                                        //textBaseline: TextBaseline.alphabetic,
                                        //letterSpacing: 2,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.8,
                                        fontFamily: 'Comfortaa'),
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  children: [
                                    Text(
                                      '“The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.”',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 44, 44),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontFamily: 'Comfortaa'),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '~ Albert Einstein',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 44, 44, 44),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          fontFamily: 'Comfortaa'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(width: 1, color: Colors.black38),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          // color: Colors.redAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 228, 220, 220),
                              offset: Offset(-0, -0),
                              blurRadius: 2,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Color.fromARGB(185, 217, 209, 209),
                              offset: Offset(1, 1),
                              blurRadius: 600,
                              spreadRadius: 5.0,
                            ),
                          ],
                          gradient: LinearGradient(colors: [
                            Colors.blueAccent,
                            Colors.purpleAccent,
                          ]),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                duration: Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          }

          //listener should be set false because at that time it s
          //hould not listen to anythimg othwise it can affect the performance of the app
        },
      ),
    );
  }
}
