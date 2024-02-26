import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slug_teach/pages/colors.dart';
import 'package:slug_teach/pages/home_page.dart';
import 'package:slug_teach/pages/search_page.dart';

import 'messages.dart';



void main(){
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Profile Page',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: maincolor),
          useMaterial3: true,
        ),
        home: const PfPage(title: 'Profile Page'),
    );
  }
}


class PfPage extends StatefulWidget{
  const PfPage({super.key, required this.title});
  final String title;
  @override
  State<PfPage> createState() => PfPageState();
}

class PfPageState extends State<PfPage>{
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary2,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage()));},
        ),

        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()));


              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage()));


              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Messages()));

              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {


              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0, left: 0,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: screenSize.width,
                maxHeight: screenSize.height * 0.25,
              ),
              color: greymain,
            ),
          ),
          Positioned(
            top: screenSize.height * 0.25, left: 0,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: screenSize.width,
                maxHeight: screenSize.height * 0.75 - 200,
              ),
              color: maincolor,
            ),
          ),
          Positioned(
            top: 0 + 0.05 * screenSize.width, left: 0 + 0.03 * screenSize.height,
            child: Column(
              children: [
                Image.asset('assets/images/emptypfp.png', scale:5),
                Text('Name', style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
          Positioned(
            top: screenSize.height * 0.65, left: screenSize.width * 0.25,
            child: SizedBox(
              width: screenSize.width*0.5,
              height: screenSize.height*0.07,
              child: ElevatedButton(
                onPressed: (){print('Connect pressed');},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor: MaterialStateProperty.all<Color>(gold),
                ),
                child: const Text('Connect', style:TextStyle(fontSize:30)),
              ),
            ),
          ),

          Positioned(
            top: screenSize.height * 0.02, left: screenSize.width*0.85,
            child: Image.asset('assets/images/editbutton.png', scale:10),
          ),
          Positioned(
            top: screenSize.height* 0.27, left: screenSize.width*0.05,
            child: Text('Bio:', style: Theme.of(context).textTheme.headlineSmall),
          ),
          Positioned(
            top: screenSize.height*0.45, left: screenSize.width*0.05,
            child: Text('Reviews:', style: Theme.of(context).textTheme.headlineSmall),
          ),
        ],
      ),
    );
  }
}