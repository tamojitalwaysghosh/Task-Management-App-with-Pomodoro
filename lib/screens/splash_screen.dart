import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:todoappu/Login/main_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      //splashIconSize: 100,
      splash: Image.asset('assets/images/icons8-checklist.gif'),
      duration: 1500,

      nextScreen: MainPage(),
      //backgroundColor: Colors.black,
      splashTransition: SplashTransition.fadeTransition,
    ));
  }
}
