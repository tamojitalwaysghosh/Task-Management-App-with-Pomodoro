import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoappu/Login/read_data/get_user.dart';
import 'package:todoappu/data/utils.dart';
import 'package:todoappu/screens/first.dart';
import 'package:todoappu/screens/splash_screen.dart';
import 'package:todoappu/widgets/new_habit_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  //document IDs
  List<String> docIDs = [];

  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIDs.add(document.reference.id);
            }));
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  void yesoutLog() {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }

  void logOut() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            content: Text(
              "Do you surely wanna log out?",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  fontFamily: 'Comfortaa'),
            ),
            actions: [
              MaterialButton(
                onPressed: yesoutLog,
                child: Text(
                  "Yes",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue.withOpacity(0.3),
              ),
              MaterialButton(
                onPressed: cancel,
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue.withOpacity(0.3),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            /* Expanded(
              child: FutureBuilder(
                future: getDocId(),
                // initialData: InitialData,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: GetUserName(documentid: docIDs[index]),
                      );
                    },
                  );
                },
              ),
            ),*/
            Container(
              padding: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height / 3.8,
              color: Colors.blue.withOpacity(0.3),
              child: Container(
                alignment: Alignment.center,
                child: ClipRRect(
                  //borderRadius: BorderRadius.circular(15.0),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image(
                      image:
                          AssetImage('assets/images/3d-fluency-male-user.png'),
                      // height: 150,
                      // width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'My Profile',
              style: TextStyle(
                  color: Color.fromARGB(255, 13, 71, 161),
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  fontFamily: 'Comfortaa'),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: Container(
                        padding: EdgeInsets.all(8.6),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 248, 248),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              // spreadRadius: 4,
                              blurRadius: 4,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          //borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            image: AssetImage('assets/images/envelope.png'),
                            // height: 150,
                            // width: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      user.email!,
                      style: TextStyle(
                          color: Color.fromARGB(255, 28, 10, 0),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontFamily: 'Comfortaa'),
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          child: Container(
                            padding: EdgeInsets.all(8.6),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 248, 248, 248),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  // spreadRadius: 4,
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                )
                              ],
                            ),
                            height: 40,
                            width: 40,
                            child: ClipRRect(
                              //borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/icons8-info-64 (1).png'),
                                // height: 150,
                                // width: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "About ToDO app",
                          style: TextStyle(
                              color: Color.fromARGB(255, 28, 10, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: 'Comfortaa'),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Container(
                          padding: EdgeInsets.all(8.6),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 13, 71, 161),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                // spreadRadius: 4,
                                blurRadius: 4,
                                offset: Offset(0, 0),
                              )
                            ],
                          ),
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                              //borderRadius: BorderRadius.circular(15.0),
                              child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          child: Container(
                            padding: EdgeInsets.all(8.6),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 248, 248, 248),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  // spreadRadius: 4,
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                )
                              ],
                            ),
                            height: 40,
                            width: 40,
                            child: ClipRRect(
                              //borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: AssetImage('assets/images/exit (1).png'),
                                // height: 150,
                                // width: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Log Out",
                          style: TextStyle(
                              color: Color.fromARGB(255, 28, 10, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: 'Comfortaa'),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        logOut();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Container(
                          padding: EdgeInsets.all(8.6),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 13, 71, 161),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                // spreadRadius: 4,
                                blurRadius: 4,
                                offset: Offset(0, 0),
                              )
                            ],
                          ),
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                              //borderRadius: BorderRadius.circular(15.0),
                              child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
