import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sentiment_dart/sentiment_dart.dart';
import 'package:helloworld/screens/topic.dart';
import 'package:helloworld/services/services.dart';
import 'package:helloworld/services/singleton.dart';
import 'package:helloworld/shared/loading.dart';

class homeScreenStudent extends StatelessWidget {
  homeScreenStudent({super.key});

  Singleton _singleton = Singleton();

  String searchContent = "";
  TextEditingController searchController = TextEditingController();

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('topics');

  Future<List<Object?>> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    List<DocumentSnapshot> data = querySnapshot.docs as List<DocumentSnapshot>;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      body: Column(children: [
        // TextField(
        //   controller: searchController,
        //   decoration: InputDecoration(
        //       border:
        //           OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        //       labelText: 'Search'),
        // ),
        FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("loading");
            }

            print("Snapshot has data for ${_singleton.accountType}");
            // print(Auth().user!.emailVerified);

            List<DocumentSnapshot> topics =
                snapshot.data as List<DocumentSnapshot>;

            return Flexible(
                child: GridView.count(
              childAspectRatio: (5 / 1),
              crossAxisCount: 1,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              children:
                  topics.map((topic) => topicEntry(document: topic)).toList(),
            ));
          },
        ),
      ]),
      bottomNavigationBar: navigationBar(index: 0),
    );
  }
}
