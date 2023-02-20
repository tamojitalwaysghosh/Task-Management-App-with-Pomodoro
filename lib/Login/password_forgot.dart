import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password reset link sent! check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: FadeInLeft(
                //duration: Duration(milliseconds: 1400),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 240, 239, 239),
                          Color.fromARGB(255, 240, 239, 239),
                          Color.fromARGB(255, 240, 239, 239),
                          Color.fromARGB(255, 240, 239, 239),
                          Color.fromARGB(255, 240, 239, 239),
                          Color.fromARGB(255, 240, 239, 239),
                          Color.fromARGB(255, 240, 239, 239),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 228, 220, 220),
                          offset: Offset(-0, -0),
                          blurRadius: 2,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Color.fromARGB(255, 217, 209, 209),
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _emailController,
                      cursorColor: Color.fromARGB(255, 44, 44, 44),
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                            fontFamily: 'Comfortaa',
                            letterSpacing: 1.23,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 44, 44, 44)),
                        hintText: "Enter Your Username",
                        hintStyle: TextStyle(
                            fontFamily: 'Comfortaa',
                            letterSpacing: 1.16,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 44, 44, 44)
                                .withOpacity(0.41)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10),
                        fillColor: Colors.transparent,
                        filled: true,
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12),
                        // borderSide: BorderSide(
                        //  width: 0.8,
                        //)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 44, 44, 44),
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.transparent,
                            )),

                        prefixIcon: Icon(
                          Icons.person,
                          color:
                              Color.fromARGB(255, 44, 44, 44).withOpacity(0.8),
                        ),
                        //suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () {},)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: passwordReset,
              child: Text('Reset Password'),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
