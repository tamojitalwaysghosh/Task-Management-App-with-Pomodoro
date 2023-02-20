import 'package:flutter/material.dart';

class AboutPomodoro extends StatefulWidget {
  const AboutPomodoro({super.key});

  @override
  State<AboutPomodoro> createState() => _AboutPomodoroState();
}

class _AboutPomodoroState extends State<AboutPomodoro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      body: ListView(
        physics: BouncingScrollPhysics(),
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
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
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
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Text(
                          "About ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 44, 44, 44),
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              fontFamily: 'Comfortaa'),
                        ),
                        Text(
                          "Pomodroro",
                          style: TextStyle(
                              color: Color.fromARGB(255, 13, 71, 161),
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              fontFamily: 'Comfortaa'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      '''The Pomodoro Technique was developed in the late 1980s by then university student Francesco Cirillo. Cirillo was struggling to focus on his studies and complete assignments. Feeling overwhelmed, he asked himself to commit to just 10 minutes of focused study time. Encouraged by the challenge, he found a tomato (pomodoro in Italian) shaped kitchen timer, and the Pomodoro technique was born.
                      
Though Cirillo went on to write a 130-page book about the method,  its biggest strength is its simplicity.

''',
                      style: TextStyle(
                          color: Color.fromARGB(255, 44, 44, 44),
                          fontWeight: FontWeight.w800,
                          fontSize: 18.9,
                          fontFamily: 'Comfortaa'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "How ToDO app's Pomodoro works?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 13, 71, 161),
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          fontFamily: 'Comfortaa'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "◉ Every session is divided into 2 parts. FOCUS and BREAK. \n\n◉ There would be 4 rounds in total. After the fourth round there will be a LONGBREAK which would end the pomodoro session.\n\n◉ Every FOCUS session would be of 25 minutes, every BREAK would be of 5 mins and every LONGBREAK would be of 10 mins.\n\n◉ The best part of our app is that you can customize your FOCUS time :)",
                      style: TextStyle(
                          color: Color.fromARGB(255, 44, 44, 44),
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          fontFamily: 'Comfortaa'),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
