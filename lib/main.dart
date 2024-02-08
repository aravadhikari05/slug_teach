import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slug_teach/pages/new_tutor_login.dart';
import 'package:slug_teach/pages/search_page.dart';
import 'firebase_options.dart';

// ...

Future<void> main() async {
  runApp(Search());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}