import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:slug_teach/pages/colors.dart';
import 'package:slug_teach/pages/home_page.dart';
import 'package:slug_teach/pages/profilepage.dart';
import 'package:slug_teach/pages/messages.dart';

class Tutor {
  final String name;
  final List<String>? subjects;
  final String birthday;
  final String description;
  final String email;
  final String grade;

  Tutor(
      {required this.name, required this.subjects, required this.birthday, required this.description, required this.email, required this.grade});

  factory Tutor.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return Tutor(
        name: data?['name'],
        subjects:
        data?['subjects'] is Iterable ? List.from(data?['subjects']) : null,
        birthday: data?['birthday'],
        description: data?['description'],
        email: data?['email'],
        grade: data?['grade']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (subjects != null) "state": subjects,
      if (birthday != null) "country": birthday,
      if (description != null) "capital": description,
      if (email != null) "population": email,
      if (grade != null) "regions": grade,
    };
  }
}





class SearchPage extends StatefulWidget {


  SearchPage(this.username,this.bio);
  String username;
  String bio;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final CollectionReference tutorCollection =
  FirebaseFirestore.instance.collection('tutors').withConverter<Tutor>(
    fromFirestore: Tutor.fromFirestore,
    toFirestore: (Tutor tutor, _) => tutor.toFirestore(),
  );

  List<Tutor> tutors = [];
  List<Tutor> filteredTutors = [];
  var checkTutors = false;

  Future<void> getTutorData(List<Tutor> tutorData) async {
    if(checkTutors) return;
    QuerySnapshot querySnapshot = await tutorCollection.get();

    querySnapshot.docs.forEach((tutor) {
      tutorData.add(tutor.data() as Tutor);
    });
    checkTutors = true;
  }





  @override
  void initState() {
    getTutorData(tutors);
    filteredTutors = tutors;
    super.initState();
  }

  void filterTutors(String query) {
    setState(() {
      filteredTutors = tutors.where((tutor) {
        return tutor.subjects != null && tutor.subjects!.any((subject) =>
            subject.toLowerCase().contains(query.toLowerCase()));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary2,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
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
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Messages(widget.username,widget.bio)),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(widget.username,widget.bio)),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SearchBar(onChanged: filterTutors),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTutors.length,
              itemBuilder: (context, index) {
                final tutor = filteredTutors[index];
                return ListTile(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage(tutor.name,tutor.description)));

                  },
                  leading: CircleAvatar(
                    child: Text(tutor.name[0]),
                  ),
                  title: Text(tutor.name),
                  subtitle: Text('Subjects: ${tutor.subjects?.join(", ")}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBar({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: 'Search by Subject',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
