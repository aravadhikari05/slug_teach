// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unused_local_variable

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:slug_teach/pages/search_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //initializing all user string data
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SearchPage()));
    String userEmail = emailController.text;
    String userPassword = passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 163, 160),
      appBar: AppBar(
          toolbarHeight: 90,
          centerTitle: false,
          title: Text('Login',
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
