import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/size_config.dart';
import 'package:helloworld/shared/bottomBarCreator.dart';
import 'package:sentiment_dart/sentiment_dart.dart';
import 'package:helloworld/screens/topic.dart';
import 'package:helloworld/services/singleton.dart';
import 'package:helloworld/services/auth.dart';
import 'package:helloworld/shared/loading.dart';

class homeScreenCreator extends StatefulWidget {
  homeScreenCreator({Key? key}) : super(key: key);

  @override
  _homeScreenCreator createState() => _homeScreenCreator();
}

class _homeScreenCreator extends State<homeScreenCreator> {
  final Stream<QuerySnapshot> _userDataStream =
      FirebaseFirestore.instance.collection(Auth().user!.uid).snapshots();
  // homeScreenCreator({super.key});
  String searchContent = "";
  TextEditingController searchController = TextEditingController();

  final Singleton _singleton = Singleton();

  List<Map<String, dynamic>> getData() {
    List<Map<String, dynamic>> data = [];

    if (_singleton.userData!.containsKey("posts")) {
      _singleton.userData!["posts"].forEach((key, value) {
        // print(key);
        value["doc_id"] = key;
        // print(value);
        data.add(value);
      });
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return StreamBuilder<QuerySnapshot>(
        stream: _userDataStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }

          // print("CREATOR'S USER DATA HAS CHANGED!");

          if (snapshot.hasData) {
            snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              _singleton.userData = data;
            });

            List<Map<String, dynamic>> topics = getData();
            return Scaffold(
              body: Column(children: [
                // TextField(
                //   controller: searchController,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30)),
                //       labelText: 'Search'),
                // ),
                SizedBox(
                  height: SizeConfig.blockSizeHorizontal! * 15,
                ),
                Center(
                    heightFactor: 0.25,
                    child: FloatingActionButton(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.add),
                        onPressed: () {
                          Navigator.pushNamed(context, '/createPost');
                          // FirebaseFirestore.instance
                          //     .collection('topics')
                          //     .add({'category': 'volunteer'});
                        })),
                (topics.isNotEmpty)
                    ? Expanded(
                        child: ListView(
                        scrollDirection: Axis.vertical,
                        children: topics
                            .map((topic) => creatorEntry(
                                  document: topic,
                                ))
                            .toList(),
                      ))
                    : Container(),
              ]),
              bottomNavigationBar: navigationBarCreator(index: 0),
            );
          } else {
            return const LoadingScreen();
          }
        });
  }
}
