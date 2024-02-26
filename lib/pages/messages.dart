import 'package:flutter/material.dart';
import 'package:slug_teach/pages/profilepage.dart';
import 'package:slug_teach/pages/search_page.dart';

import 'colors.dart';
import 'home_page.dart';


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
class Messages extends StatelessWidget {
  Messages(this.username, {super.key});
  final String username;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
          backgroundColor: primary,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()));},
              ),
              automaticallyImplyLeading: false,
              backgroundColor: primary2,
              title: Text('Messages Page'),
            ),
            bottomNavigationBar: BottomAppBar(

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [

                  IconButton(

                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.of(context).push(_createRoute(HomePage()));

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.of(context).push(_createRoute(SearchPage(username)));


                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.chat),
                    onPressed: () {


                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    onPressed: () {
                      Navigator.of(context).push(_createRoute(ProfilePage(username)));

                    },
                  ),
                ],
              ),
            ),
            body: Center(
                child: Text(
                  'Messages not implemented yet',
                )
            )
        )
    );
  }
}