import 'package:event/auth_screen.dart';
import 'package:event/home_add_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Event Manager"),
        actions: [
          IconButton(
              onPressed: () {
                Auth(FirebaseAuth.instance).signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => AuthScreen(),
                  ),
                );
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(
                  "2:30:45",
                  style: TextStyle(fontSize: 25, wordSpacing: 10),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Name",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Location",
                    )
                  ],
                ),
                trailing:
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddEventPage()));
        },
        label: Row(children: [Icon(Icons.add), Text("Add Event")]),
      ),
    );
  }
}
