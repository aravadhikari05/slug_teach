// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unused_local_variable

import 'dart:ffi';

import 'package:flutter/material.dart';

class TutorLogin extends StatefulWidget {
  const TutorLogin({super.key});

  @override
  State<TutorLogin> createState() => _TutorLoginState();
}

class _TutorLoginState extends State<TutorLogin> {
  //initializing all user string data
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isNumeric(String str) {
    try {
      var value = double.parse(str);
    } on FormatException {
      return false;
    } finally {
      return true;
    }
  }

  void done() {
    String userEmail = emailController.text;
    String userPassword = passwordController.text;
    String userFirstName = firstNameController.text;
    String userLastName = lastNameController.text;
    String userGrade = gradeController.text;
    String userBirthday = birthdayController.text;
    String userSubject = subjectController.text;
    String userDescription = descriptionController.text;

    List<String> birthday = userBirthday.split("");
    if ((birthday[2] == '/' && birthday[5] == '/') &&
        birthday.length == 10 &&
        (isNumeric(birthday[0]) &&
            isNumeric(birthday[1]) &&
            isNumeric(birthday[3]) &&
            isNumeric(birthday[4]) &&
            isNumeric(birthday[6]) &&
            isNumeric(birthday[7]) &&
            isNumeric(birthday[8]) &&
            isNumeric(birthday[9]))) {
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('text'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 163, 160),
      appBar: AppBar(
          toolbarHeight: 90,
          centerTitle: false,
          title: Text('Tutor',
              style: TextStyle(color: Colors.black, fontSize: 60)),
          backgroundColor: const Color.fromARGB(255, 206, 206, 206)),

      //LIST OF ALL TEXTS AND INPUTS
      body: Scrollbar(
        child: ListView(
          children: [
            //EMAIL TEXT
            Padding(
                padding: EdgeInsets.only(right: 2, top: 5),
                child: Text(
                  "  Email:",
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.left,
                )),

            //EMAIL INPUt
            Padding(
              padding: const EdgeInsets.only(right: 60, left: 16),
              child: TextField(
                controller: emailController,
                autocorrect: false,
                style: TextStyle(fontSize: 21, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Example@gmail.com',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Color.fromARGB(255, 206, 206, 206),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: -15, horizontal: 9),
                ),
              ),
            ),
            SizedBox(height: 15),
            //PASSWORD TEXT
            Padding(
              padding: const EdgeInsets.only(right: 230, left: 10),
              child: Text(
                " Password:",
                style: TextStyle(fontSize: 25),
              ),
            ),
            //PASSWORD INPUT
            Padding(
              padding: const EdgeInsets.only(right: 60, left: 16),
              child: TextField(
                controller: passwordController,
                autocorrect: false,
                style: TextStyle(fontSize: 21, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Minimum 8 characters',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Color.fromARGB(255, 206, 206, 206),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: -15, horizontal: 9),
                ),
              ),
            ),

            SizedBox(height: 15),
            //FIRST NAME TEXT
            Padding(
              padding: const EdgeInsets.only(right: 230, left: 10),
              child: Text(
                " First Name:",
                style: TextStyle(fontSize: 25),
              ),
            ),
            //FIRST NAME INPUT
            Padding(
              padding: const EdgeInsets.only(right: 160, left: 16),
              child: TextField(
                controller: firstNameController,
                autocorrect: false,
                style: TextStyle(fontSize: 21, color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Color.fromARGB(255, 206, 206, 206),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: -15, horizontal: 9),
                ),
              ),
            ),

            SizedBox(height: 15),
            //LAST NAME TEXT
            Padding(
              padding: const EdgeInsets.only(right: 230, left: 10),
              child: Text(
                " Last Name:",
                style: TextStyle(fontSize: 25),
              ),
            ),
            //LAST NAME INPUT
            Padding(
              padding: const EdgeInsets.only(right: 160, left: 16),
              child: TextField(
                controller: lastNameController,
                autocorrect: false,
                style: TextStyle(fontSize: 21, color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Color.fromARGB(255, 206, 206, 206),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: -15, horizontal: 9),
                ),
              ),
            ),

            SizedBox(height: 15),
            //GRADE TEXT
            Text(
              "  Grade (N/A if none):",
              style: TextStyle(fontSize: 25),
            ),

            //GRADE INPUT
            Padding(
              padding: const EdgeInsets.only(right: 120, left: 16),
              child: TextField(
                controller: gradeController,
                autocorrect: false,
                style: TextStyle(fontSize: 21, color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Color.fromARGB(255, 206, 206, 206),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: -15, horizontal: 9),
                ),
              ),
            ),

            SizedBox(height: 15),
            //BIRTHDAY TEXT
            Text(
              "  Birthday:",
              style: TextStyle(fontSize: 25),
            ),

            //BIRTHDAY INPUT
            Padding(
              padding: const EdgeInsets.only(right: 220, left: 16),
              child: TextField(
                controller: birthdayController,
                autocorrect: false,
                style: TextStyle(fontSize: 21, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'MM/DD/YYYY',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Color.fromARGB(255, 206, 206, 206),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: -15, horizontal: 9),
                ),
              ),
            ),

            SizedBox(height: 15),
            //SUBJECT CHOOSER TEXT
            Text(
              "  Subject(s) to tutor:",
              style: TextStyle(fontSize: 25),
            ),

            //SUBJECT INPUT
            Padding(
              padding: const EdgeInsets.only(right: 60, left: 16),
              child: TextField(
                controller: subjectController,
                autocorrect: false,
                style: TextStyle(fontSize: 21, color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Color.fromARGB(255, 206, 206, 206),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: -15, horizontal: 9),
                ),
              ),
            ),

            SizedBox(height: 15),
            //DESCRIPTION TEXT
            Text(
              "  Description of yourself:",
              style: TextStyle(fontSize: 25),
            ),

            //DESCRIPTION INPUT
            Padding(
              padding: const EdgeInsets.only(right: 60, left: 16),
              child: TextField(
                controller: descriptionController,
                autocorrect: false,
                style: TextStyle(fontSize: 21, color: Colors.black),
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Max 200 characters',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Color.fromARGB(255, 206, 206, 206),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 6, horizontal: 9),
                ),
              ),
            ),

            SizedBox(height: 20),
            //DONE BUTTON
            Padding(
                padding: const EdgeInsets.only(right: 60, left: 16),
                child: Center(
                  child: ElevatedButton(
                      onPressed: done,
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          // If the button is pressed, return green, otherwise blue
                          if (states.contains(MaterialState.pressed)) {
                            return Color.fromARGB(255, 194, 194, 194);
                          }
                          return Color.fromARGB(255, 206, 206, 206);
                        }),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
