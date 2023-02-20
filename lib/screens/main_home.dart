import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'package:intl/intl.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:todoappu/Login/login.dart';
import 'package:todoappu/data/habit_db.dart';

import 'package:todoappu/widgets/add_task.dart';
import 'package:todoappu/widgets/fab.dart';
import 'package:todoappu/widgets/habit_tile.dart';
import 'package:todoappu/widgets/monthly_summary.dart';
import 'package:todoappu/widgets/new_habit_box.dart';

class HomePageHive extends StatefulWidget {
  const HomePageHive({super.key});

  @override
  State<HomePageHive> createState() => _HomePageHiveState();
}

class _HomePageHiveState extends State<HomePageHive> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");
  final keyOne = GlobalKey();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    // if there is no current habit list, then it is the 1st time ever opening the app
    // then create default data
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => ShowCaseWidget.of(context).startShowCase([keyOne]));
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }

    // there already exists data, this is not the first time
    else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();

    super.initState();
  }

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  // create a new habit
  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    // show alert dialog for user to enter the new habit details
    showDialog(
      context: context,
      builder: (context) {
        return AddTaskNew(
          controller: _newHabitNameController,
          hintText: 'Enter task name..',
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  // save new habit
  void saveNewHabit() {
    // add new habit to todays habit list
    if (_newHabitNameController.text.isNotEmpty) {
      setState(() {
        db.todaysHabitList.add([_newHabitNameController.text, false]);
      });

      // clear textfield
      _newHabitNameController.clear();
      // pop dialog box
      Navigator.of(context).pop();
      db.updateDatabase();
    } else if (_newHabitNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            height: 90,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  //borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    image: AssetImage('assets/images/decline.png'),
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Required Title.',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              fontFamily: 'Comfortaa'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'You need to give a title to your task',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              fontFamily: 'Comfortaa'),
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                // color: Colors.redAccent,
                gradient: LinearGradient(colors: [
                  Colors.redAccent,
                  Colors.redAccent,
                ]),
                borderRadius: BorderRadius.circular(20)),
          ),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );
      //Navigator.pop(context);
      return;
    }
  }

  // cancel new habit
  void cancelDialogBox() {
    // clear textfield
    _newHabitNameController.clear();

    // pop dialog box
    Navigator.of(context).pop();
  }

  // open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AddTaskNew(
          controller: _newHabitNameController,
          hintText: db.todaysHabitList[index][0],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  // save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  // delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ToDO app ',
          style: TextStyle(
              color: Color.fromARGB(255, 28, 10, 0),
              fontWeight: FontWeight.w900,
              fontSize: 24,
              fontFamily: 'Comfortaa'),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      //floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 10,
          ),
          /*Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            //padding: EdgeInsets.only(left: 20, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hello, Tamojit!',
                          style: TextStyle(
                              color: Color.fromARGB(255, 28, 10, 0),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: 'Comfortaa'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                        ),
                        Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 9),
                              child: Text(
                                DateFormat.yMMMEd().format(
                                  DateTime.now(),
                                ),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 240, 239, 239),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: 'Comfortaa'),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 28, 10, 0),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.black38),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                //spreadRadius: 2,
                                //blurRadius: 4,
                                //offset: Offset(0, 2),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      '“The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.”',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
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
                          color: Colors.white,
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
              color: Color.fromARGB(255, 28, 10, 0),
              // borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: Colors.black38),
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

          SizedBox(
            height: 10,
          ),*/
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hey there, ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 28, 10, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 18.5,
                          fontFamily: 'Comfortaa'),
                    ),
                    Text(
                      user.email!.substring(0, user.email!.indexOf('@')),
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w800,
                          fontSize: 18.5,
                          fontFamily: 'Comfortaa'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daily Tasks',
                  style: TextStyle(
                      color: Color.fromARGB(255, 28, 10, 0),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      fontFamily: 'Comfortaa'),
                ),
                InkWell(
                  onTap: createNewHabit,
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.all(8),
                    //margin: EdgeInsets.only(right: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.blue[900],
                          size: 18.5,
                        ),
                        Text(
                          'Add New Task',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              fontFamily: 'Comfortaa'),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // list of habits
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: db.todaysHabitList.length == 0
                ? Column(
                    children: [
                      ClipRRect(
                        //borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          image: AssetImage('assets/images/pablita-516.gif'),
                          // height: 150,
                          // width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        '^^ looking so empty, add some tasks! ^^',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            fontFamily: 'Comfortaa'),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Container(
                          child: Center(
                            child: Text(
                              "* swipe tile to delete or edit it ",
                              style: TextStyle(
                                  color: Color.fromARGB(185, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  fontFamily: 'Comfortaa'),
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: db.todaysHabitList.length,
                        itemBuilder: (context, index) {
                          return HabitTile(
                            habitName: db.todaysHabitList[index][0],
                            habitCompleted: db.todaysHabitList[index][1],
                            onChanged: (value) => checkBoxTapped(value, index),
                            settingsTapped: (context) =>
                                openHabitSettings(index),
                            deleteTapped: (context) => deleteHabit(index),
                          );
                        },
                      ),
                    ],
                  ),
          ),
          SizedBox(
            height: 20,
          ),
          //HomePage(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Container(
              child: Text(
                "Daily Tracker",
                style: TextStyle(
                    color: Color.fromARGB(255, 28, 10, 0),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: 'Comfortaa'),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          // monthly summary heat map
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MonthlySummary(
                    datasets: db.heatMapDataSet,
                    startDate: _myBox.get("START_DATE"),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            constraints: BoxConstraints(maxWidth: double.infinity),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
