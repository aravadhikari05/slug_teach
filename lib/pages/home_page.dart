import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slug_teach/pages/colors.dart';
import 'package:slug_teach/pages/profilepage.dart';
import 'package:slug_teach/pages/search_page.dart';

import 'messages.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Route _createRoute(Widget app) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => app,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = 0.0;
      var end = 1.0;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _HomePageState extends State<HomePage> {
  String _userName = 'User';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {

        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('students').doc(user.uid).get();


        setState(() {
          _userName = userDoc['name'];
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home Page'),
        backgroundColor: primary2,
      ),
      body: Center(
        child: Text('Welcome, $_userName'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(_createRoute(SearchPage(_userName)));
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                Navigator.of(context).push(_createRoute(Messages(_userName)));
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context).push(_createRoute(ProfilePage(_userName)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
