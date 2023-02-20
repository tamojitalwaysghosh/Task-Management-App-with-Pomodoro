import 'package:flutter/material.dart';
import 'package:todoappu/Login/login.dart';
import 'package:todoappu/Login/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //initially show login page
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage == true) {
      return Login(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(
        showLoginPage: toggleScreens,
      );
    }
  }
}
