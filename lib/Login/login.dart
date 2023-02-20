import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoappu/Login/password_forgot.dart';

class Login extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const Login({super.key, required this.showRegisterPage});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool tick = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          height: 120,
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
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Error occured',
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
                          e.message.toString(),
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
      ));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 239, 239),
      body: ListView(
        children: [
          FadeInDown(
            child: Container(
              // color: Colors.amber,
              margin: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 30,
              ),
              height: ht / 2.6,
              //width: wt / 5,
              // height: 165,
              // width: MediaQuery.of(context).size.width,
              // decoration: BoxDecoration(color: Colors.transparent),

              child: ClipRRect(
                //borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/marginalia-password-protection.gif',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          FadeInLeft(
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
                    labelText: "Email",
                    labelStyle: TextStyle(
                        fontFamily: 'Comfortaa',
                        letterSpacing: 1.23,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 44, 44, 44)),
                    hintText: "Enter Your Email",
                    hintStyle: TextStyle(
                        fontFamily: 'Comfortaa',
                        letterSpacing: 1.16,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color:
                            Color.fromARGB(255, 44, 44, 44).withOpacity(0.41)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
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
                      color: Color.fromARGB(255, 44, 44, 44).withOpacity(0.8),
                    ),
                    //suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () {},)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeInRight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  controller: _passwordController,
                  obscureText: tick == true ? true : false,
                  cursorColor: Color.fromARGB(255, 44, 44, 44),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontFamily: 'Comfortaa',
                        letterSpacing: 1.16,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 44, 44, 44)),
                    hintText: "Enter Your Password",
                    hintStyle: TextStyle(
                        fontFamily: 'Comfortaa',
                        letterSpacing: 1.16,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color:
                            Color.fromARGB(255, 44, 44, 44).withOpacity(0.41)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                    fillColor: Colors.transparent,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 44, 44, 44),
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 0.8,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(width: 0.8, color: Colors.transparent
                                //  color: Color.fromARGB(255, 44, 44, 44),
                                )),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 44, 44, 44).withOpacity(0.8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon((tick == true)
                          ? Icons.enhanced_encryption_rounded
                          : Icons.remove_red_eye),
                      color: Color.fromARGB(255, 13, 71, 161),
                      onPressed: () {
                        setState(() {
                          tick = !tick;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          FadeInUp(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: signIn,
                child: Container(
                  height: 50,
                  width: 20,
                  //color: Color.fromARGB(255, 44, 44, 44),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                          letterSpacing: 5.2,
                          color: Color.fromARGB(255, 240, 239, 239)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 13, 71, 161),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          FadeIn(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                        color: Color.fromARGB(255, 44, 44, 44),
                      )),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(" SignUp now",
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 13, 71, 161),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
