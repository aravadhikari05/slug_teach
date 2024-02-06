import 'package:flutter/material.dart';
import 'package:slug_teach/pages/colors.dart';

void main() {
  runApp(const MyApp());
}
class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => _WelcomeScreenState();

  
  
}
class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: primary2,
       title: Text(widget.title, style: TextStyle()),
      ),
      body: Center(
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
            TextButton(onPressed: () {  }, style: TextButton.styleFrom(
              backgroundColor: primary2
            ),child: const Text(' Student ',
                style: TextStyle(height: 2, fontSize: 30),),),
              const SizedBox(height:30),
            TextButton(onPressed: () {  },style: TextButton.styleFrom(

                backgroundColor: primary2
            ), child: const Text(' Teacher ',
              style: TextStyle(height: 2, fontSize: 30),),),
            const SizedBox(height:150),
            TextButton(onPressed: () {  },style: TextButton.styleFrom(

                backgroundColor: primary2
            ), child: const Text(' Login ',
              style: TextStyle(height: 2, fontSize: 15)),),



          ]






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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: primary,
        primarySwatch: primary,

        useMaterial3: true,
      ),
      home: const WelcomeScreen(title: 'Slug Teach'),
    );

    
  }
}

