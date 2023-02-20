import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoappu/Login/auth_page.dart';
import 'package:todoappu/Login/login.dart';
import 'package:todoappu/screens/bottomnav.dart';
import 'package:todoappu/screens/first.dart';
import 'package:todoappu/screens/main_home.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return BottomNav();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
