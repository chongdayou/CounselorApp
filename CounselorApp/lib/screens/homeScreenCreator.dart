import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:helloworld/shared/bottomBarCreator.dart';
import 'package:sentiment_dart/sentiment_dart.dart';
import 'package:helloworld/screens/topic.dart';
import 'package:helloworld/services/singleton.dart';

class homeScreenCreator extends StatelessWidget {
  homeScreenCreator({super.key});
  String searchContent = "";
  TextEditingController searchController = TextEditingController();

  Singleton _singleton = Singleton();

  List<Map<String, dynamic>> getData() {
    List<Map<String, dynamic>> data = [];

    _singleton.userData!["posts"].forEach((key, value) {
      print(key);
      print(value);
      data.add(value);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    List<Map<String, dynamic>> topics = getData();
    return Scaffold(
      body: Column(children: [
        TextField(
          controller: searchController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              labelText: 'Search'),
        ),
        Center(
            child: FloatingActionButton(
                backgroundColor: Colors.green,
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, '/createPost');
                  // FirebaseFirestore.instance
                  //     .collection('topics')
                  //     .add({'category': 'volunteer'});
                })),
        Flexible(
            child: GridView.count(
          childAspectRatio: (5 / 1),
          crossAxisCount: 1,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          shrinkWrap: true,
          children: topics
              .map((topic) => creatorEntry(
                    document: topic,
                    docId: '',
                  ))
              .toList(),
        ))
      ]),
      bottomNavigationBar: navigationBarCreator(index: 0),
    );
  }
}
