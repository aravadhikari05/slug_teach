import 'package:flutter/material.dart';
import 'package:slug_teach/pages/colors.dart';
import 'package:slug_teach/pages/home_page.dart';
import 'package:slug_teach/pages/profilepage.dart';

import 'messages.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
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
        title: const Text('Search'),
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
                        builder: (context) =>
                            HomePage()));

              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {



              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Messages()));

              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage()));

              },
            ),
          ],
        ),
      ),
      body: Column(

        children: [

          SearchBar(),
          const Expanded(
            child: Center(
              child: Text('Search results will be displayed here!'),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: const TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

