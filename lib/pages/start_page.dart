import 'package:flutter/material.dart';
import 'package:slug_teach/pages/colors.dart';
import 'package:slug_teach/pages/new_student_login.dart';

import 'login_page.dart';
import 'new_tutor_login.dart';


class StartPage extends StatefulWidget{

  const StartPage({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => _StartPageState();

  
  
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
class _StartPageState extends State<StartPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: primary2,
       title: Text(widget.title, style: const TextStyle()),
      ),
      body: Center(

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
              ),
          DecoratedBox(

          decoration: BoxDecoration(color: primary2,borderRadius: BorderRadius.circular(6.0)),

          child: const Text(
              '     Sign up as a:     ',
               style: TextStyle(height: 1.5, fontSize: 40),

          ),
        ),
              const SizedBox(height:180),
              TextButton(onPressed: () {Navigator.of(context).push(_createRoute(StudentLogin(subjects: [])));}, style: TextButton.styleFrom(
                backgroundColor: primary2
              ),child: const Text(' Student ',
                  style: TextStyle(height: 2, fontSize: 30),),),
                const SizedBox(height:30),
              TextButton(onPressed: () {
                Navigator.of(context).push(_createRoute(TutorLogin(subjects: [])));

                  },style: TextButton.styleFrom(

                  backgroundColor: primary2
              ), child: const Text(' Tutor ',
                style: TextStyle(height: 2, fontSize: 30),),),
              const SizedBox(height:150),
              TextButton(onPressed: () {Navigator.of(context).push(_createRoute(Login())); },style: TextButton.styleFrom(

                  backgroundColor: primary2
              ), child: const Text(' Login ',
                style: TextStyle(height: 2, fontSize: 15)),),




            ]






          )

      )
      )
    );




  }
  
}

    



