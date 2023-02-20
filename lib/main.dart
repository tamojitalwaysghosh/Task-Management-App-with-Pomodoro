import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoappu/Login/login.dart';
import 'package:todoappu/Login/main_page.dart';

import 'package:todoappu/data/timer_service.dart';
import 'package:todoappu/screens/bottomnav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoappu/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //gives access to native code
  await Firebase.initializeApp();

  //initialize hive
  await Hive.initFlutter();

  //open a box
  await Hive.openBox("Habit_Database");

  runApp(ChangeNotifierProvider<TimerService>(
    create: (_) => TimerService(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
