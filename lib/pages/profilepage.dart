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
              constraints: const BoxConstraints(
                maxWidth: 400,
                maxHeight: 200,
              ),
              color: greymain,
            ),
          ),
          Positioned(
            top: 200, left: 0,
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400,
                maxHeight: 540,
              ),
              color: maincolor,
            ),
          ),
          Positioned(
            top: 25, left: 25,
            child: Column(
              children: [
                Image.asset('assets/images/emptypfp.png', scale:5),
                Text('Name', style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
          Positioned(
            top: 540, left: 112,
            child: ElevatedButton(
              onPressed: (){print('Connect pressed');},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(gold),
              ),
              child: const Text('Connect', style:TextStyle(fontSize:30)),
            ),
          ),

          Positioned(
            top: 10, left: 335,
            child: Image.asset('assets/images/editbutton.png', scale:10),
          ),
          Positioned(
            top: 225, left: 25,
            child: Text('Bio:', style: Theme.of(context).textTheme.headlineSmall),
          ),
          Positioned(
            top: 375, left: 25,
            child: Text('Reviews:', style: Theme.of(context).textTheme.headlineSmall),
          ),
        ],
      ),
    );
  }
}