import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todoappu/screens/main_home.dart';
import 'package:todoappu/screens/pomodoro_screen.dart';
import 'package:todoappu/screens/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List pages = [HomePageHive(), PomodoroScreen(), ProfileScreen()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: onTap,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.timelapse,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
        height: 50,
        buttonBackgroundColor: Color.fromARGB(255, 13, 71, 161),
        color: Color.fromARGB(255, 13, 71, 161),
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        animationDuration: Duration(milliseconds: 450),
      ),
    );
  }
}
