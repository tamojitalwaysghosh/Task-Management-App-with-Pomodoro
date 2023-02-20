import 'package:flutter/material.dart';
import 'package:todoappu/Login/auth_page.dart';
import 'package:todoappu/Login/signup.dart';
import 'package:todoappu/data/utils.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          Center(
            child: Text(
              'Now boost your productivity',
              style: TextStyle(
                  color: Color.fromARGB(255, 28, 10, 0),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'Comfortaa'),
            ),
          ),
          ClipRRect(
            //borderRadius: BorderRadius.circular(15.0),
            child: Image(
              image: AssetImage('assets/images/transistor-team-work.gif'),
              // height: 150,
              // width: 100,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Text(
              'with,',
              style: TextStyle(
                  color: Color.fromARGB(255, 28, 10, 0),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'Comfortaa'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'ToDO app',
              style: TextStyle(
                  color: Color.fromARGB(255, 28, 10, 0),
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  fontFamily: 'Comfortaa'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Container(
          child: GestureDetector(
            onTap: (() => Navigator.push(
                context, MaterialPageRoute(builder: (_) => AuthPage()))),
            child: Container(
              height: 54,
              width: 150,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text("Get Started",
                          style: textStyle(
                            20,
                            Colors.white,
                            FontWeight.w800,
                          )),
                    ),
                    Positioned(
                      right: 20,
                      child: Container(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}
