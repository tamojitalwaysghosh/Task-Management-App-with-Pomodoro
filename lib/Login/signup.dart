import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool tick = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      //add user details
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.toString(),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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

  Future addUserDetails(String firstName, String lastName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
    });
  }

  bool passswordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
              height: 200,
              //width: wt / 5,
              // height: 165,
              // width: MediaQuery.of(context).size.width,
              // decoration: BoxDecoration(color: Colors.transparent),

              child: ClipRRect(
                //borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/hello.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
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
                  controller: _firstNameController,
                  cursorColor: Color.fromARGB(255, 44, 44, 44),
                  decoration: InputDecoration(
                    labelText: "Firstname",
                    labelStyle: TextStyle(
                        fontFamily: 'Comfortaa',
                        letterSpacing: 1.23,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 44, 44, 44)),
                    hintText: "Enter Your Firstname",
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
            height: 20,
          ),
          FadeInRight(
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
                  controller: _lastNameController,
                  cursorColor: Color.fromARGB(255, 44, 44, 44),
                  decoration: InputDecoration(
                    labelText: "Lastname",
                    labelStyle: TextStyle(
                        fontFamily: 'Comfortaa',
                        letterSpacing: 1.23,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 44, 44, 44)),
                    hintText: "Enter Your Lastname",
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
            height: 20,
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
          FadeInLeft(
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
                  controller: _confirmPasswordController,
                  obscureText: tick == true ? true : false,
                  cursorColor: Color.fromARGB(255, 44, 44, 44),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
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
            height: 20,
          ),
          FadeInUp(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 38, bottom: 36),
              child: GestureDetector(
                onTap: signUp,
                child: Container(
                  height: 50,
                  width: 20,
                  //color: Color.fromARGB(255, 44, 44, 44),
                  child: Center(
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                          letterSpacing: 5.2,
                          color: Color.fromARGB(255, 240, 239, 239)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 44, 44, 44),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeIn(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a member?",
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                        color: Color.fromARGB(255, 44, 44, 44),
                      )),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(" Login now",
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
