import 'package:flutter/material.dart';
import 'package:slug_teach/pages/colors.dart';
import 'package:slug_teach/pages/new_student_login.dart';

import 'login_page.dart';
import 'new_tutor_login.dart';

void main() {
  runApp(const MyApp());
}
class StartPage extends StatefulWidget{

  const StartPage({super.key, required this.title});
  main() {
    // TODO: implement main
    throw UnimplementedError();
  }
  final String title;

  @override
  State<StatefulWidget> createState() => _StartPageState();

  
  
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
              TextButton(onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const StudentLogin())); }, style: TextButton.styleFrom(
                backgroundColor: primary2
              ),child: const Text(' Student ',
                  style: TextStyle(height: 2, fontSize: 30),),),
                const SizedBox(height:30),
              TextButton(onPressed: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const TutorLogin()));  },style: TextButton.styleFrom(

                  backgroundColor: primary2
              ), child: const Text(' Tutor ',
                style: TextStyle(height: 2, fontSize: 30),),),
              const SizedBox(height:150),
              TextButton(onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const Login())); },style: TextButton.styleFrom(

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
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    },
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        scaffoldBackgroundColor: primary,
        primarySwatch: primary,

        useMaterial3: true
      ),
      home: const StartPage(title: 'Slug Teach'),
    )
    );

    
  }
}

