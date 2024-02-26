// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unused_local_variable

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../user_auth/authentication.dart';
import 'colors.dart';
import 'home_page.dart';

class TutorLogin extends StatefulWidget {
  final List<String> subjects;
  const TutorLogin({super.key, required this.subjects});

  @override
  State<TutorLogin> createState() => _TutorLoginState();
}

class MultiSelect extends StatefulWidget {
  final List<String> subjects;
  const MultiSelect({super.key, required this.subjects});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedSubjects = [];

  // This function is triggered when a checkbox is checked or unchecked
  void _subjectChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedSubjects.add(itemValue);
      } else {
        _selectedSubjects.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedSubjects);
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Subjects'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.subjects
              .map((item) => CheckboxListTile(
                    value: _selectedSubjects.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _subjectChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text(
            'Done',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class _TutorLoginState extends State<TutorLogin> {
  List<String> _selectedSubjects = [];
  Authentication _auth = Authentication();

  void _showMultiSelect() async {
    final List<String> subjects = ['Math', 'English', 'Science'];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(
          subjects: subjects,
        );
      },
    );

    if (results != null) {
      setState(() {
        _selectedSubjects = results;
      });
    }
  }

  //initializing all user string data
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  //TextEditingController subjectController = TextEditingController();
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

  Future<void> done() async{
    void invalidField(String message) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                message,
                textAlign: TextAlign.center,
              ),
            );
          });
    }
    String userEmail = emailController.text;
    String userPassword = passwordController.text;
    String userFirstName = firstNameController.text;
    String userLastName = lastNameController.text;
    String userGrade = gradeController.text;
    String userBirthday = birthdayController.text;
    //String userSubject = subjectController.text;
    String userDescription = descriptionController.text;
    List<String> userSubjects = _selectedSubjects;

    if(userEmail == '' || userPassword == '' || userFirstName == '' || userLastName == '' || userGrade == '' || userBirthday == '' || userDescription == '' || userSubjects.isEmpty) {
      invalidField("Please fill out all of the fields");
      return;
    }
    if(userPassword.length < 8) {
      invalidField("Password must be longer than 8 characters");
      return;
    }
    if (userBirthday.length == 10) {
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
        invalidField('Invalid Birthday, please use MM/DD/YYYY format');
        return;
      }
    } else {
      invalidField('Invalid Birthday, please use MM/DD/YYYY format');
      return;
    }
    User? user = await _auth.signUpWithEmailAndPassword(userEmail, userPassword);

    if(user != null) {
      String userId = user.uid;
      print(userId + userEmail + userFirstName);
      final CollectionReference studentsCollection =
        FirebaseFirestore.instance.collection('tutors');
      if (!(await studentsCollection.doc(userId).get()).exists){
        studentsCollection.doc(userId).set({
          'email': userEmail,
          'name': userFirstName + ' ' + userLastName,
          'birthday': userBirthday,
          'grade': userGrade,
          'description': userDescription,
          'subjects': userSubjects,
          // Other user info fields can be added here
        })
            .catchError((error) => print('Failed:$error'));
      }
      else print('this error');

      print("Successfully created a tutor account");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomePage()));
    } else {
      print('Could not create a tutor account');
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
          backgroundColor: primary2),

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // use this button to open the multi-select dialog
                  ElevatedButton(
                      onPressed: _showMultiSelect,
                      child: Align(
                        child: const Text('Click to Select Subjects',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: Colors.black))),
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          // If the button is pressed, return green, otherwise blue
                          if (states.contains(MaterialState.pressed)) {
                            return Color.fromARGB(255, 194, 194, 194);
                          }
                          return Color.fromARGB(255, 206, 206, 206);
                        }),
                      )),

                  // display selected items
                  Wrap(
                    children: _selectedSubjects
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Chip(
                                side: BorderSide(color: Colors.black),
                                backgroundColor:
                                    Color.fromARGB(255, 206, 206, 206),
                                label: Text(e),
                              ),
                            ))
                        .toList(),
                  )
                ],
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
