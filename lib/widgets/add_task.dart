import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoappu/widgets/button.dart';

class AddTaskNew extends StatelessWidget {
  final controller;
  final String hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const AddTaskNew(
      {super.key,
      this.controller,
      required this.hintText,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'ToDO app ',
            style: TextStyle(
                color: Color.fromARGB(255, 44, 44, 44),
                fontWeight: FontWeight.w900,
                fontSize: 24,
                fontFamily: 'Comfortaa'),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Center(
              child: Column(children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 44, 44, 44),
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Add a new task',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                            fontFamily: 'Comfortaa'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Title',
                    style: TextStyle(
                        color: Color.fromARGB(255, 44, 44, 44),
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                        fontFamily: 'Comfortaa'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                      fillColor: Color.fromARGB(255, 236, 233, 233),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0.8,
                            //color: Color.fromARGB(255, 160, 18, 18)
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.5),
                          borderSide: BorderSide(
                            width: 0.8,
                            color: Colors.white,
                          )),
                      hintText: hintText,
                      hintStyle: TextStyle(fontFamily: 'Comfortaa'),
                      //prefixIcon: Icon(Icons.person),
                      //suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () {},)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(label: "cancel", onTap: onCancel),
                    MyButton(label: "save", onTap: onSave)
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ]),
            ),
          ],
        ));
  }
}
