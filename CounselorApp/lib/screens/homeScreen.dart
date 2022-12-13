import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  String searchContent = "";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  FirebaseFirestore.instance
                      .collection('topics')
                      .add({'category': 'volunteer'});
                })),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('topics').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text("loading");
            }

            print("Snapshot has data");
            return Flexible(
                child: GridView.count(
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              children: snapshot.data!.docs.map((document) {
                return Container(
                  child: Center(child: Text(document['category'])),
                );
              }).toList(),
            ));
          },
        ),
      ]),
      bottomNavigationBar: const navigationBar(),
    );
  }
}
