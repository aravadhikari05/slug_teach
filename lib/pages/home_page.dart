import 'package:flutter/material.dart';
import 'package:slug_teach/pages/colors.dart';
import 'package:slug_teach/pages/profilepage.dart';
import 'package:slug_teach/pages/search_page.dart';

import 'messages.dart';
void main(){
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


  @override
  Widget build(BuildContext context) {
   

        return Scaffold(
          backgroundColor: primary,
          appBar: AppBar(
              automaticallyImplyLeading: false,
            title: Text('Home Page'),
            backgroundColor: primary2,
          ),

          bottomNavigationBar: BottomAppBar(

            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                IconButton(

                  icon: Icon(Icons.home),
                  onPressed: () {

                  },
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.of(context).push(_createRoute(SearchPage()));


                  },
                ),
                IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {
                    Navigator.of(context).push(_createRoute(Messages()));

                  },
                ),
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    Navigator.of(context).push(_createRoute(ProfilePage()));

                  },
                ),
              ],
            ),
          ),
      );
    }
  }

