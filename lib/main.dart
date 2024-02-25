import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slug_teach/pages/colors.dart';
import 'package:slug_teach/pages/home_page.dart';
import 'package:slug_teach/pages/new_tutor_login.dart';
import 'package:slug_teach/pages/search_page.dart';
import 'package:slug_teach/pages/start_page.dart';
import 'firebase_options.dart';

// ...

Future<void> main() async {
  runApp(Start());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

          scaffoldBackgroundColor: primary,
          primarySwatch: primary,

          useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,

      home: const StartPage(title: 'Slug Teach',),
    );
  }
}