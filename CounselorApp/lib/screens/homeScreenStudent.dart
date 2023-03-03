import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/screens/topic.dart';
import 'package:helloworld/services/singleton.dart';

class homeScreenStudent extends StatefulWidget {
  const homeScreenStudent({super.key});

  @override
  State<homeScreenStudent> createState() => _homeScreenStudentState();
}

// class _homeScreenStudentState extends State<homeScreenStudent> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class _homeScreenStudentState extends State<homeScreenStudent> {
  // homeScreenStudent({super.key});

  Singleton _singleton = Singleton();

  String searchContent = "";
  TextEditingController searchController = TextEditingController();

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('topics');

  Future<List<Object?>> getData() async {
    // Get docs from collection reference

    if (_singleton.postsCache == null || _singleton.refreshing) {
      QuerySnapshot querySnapshot = await _collectionRef.get();
      print("Using new posts");
      _singleton.refreshing = false;
      List<DocumentSnapshot> data = querySnapshot.docs;
      return data;
    }
    print("Using cached posts");
    return _singleton.postsCache as List<DocumentSnapshot>;
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

            _singleton.postsCache = topics;

            return Expanded(
              child: RefreshIndicator(
                child: ListView(
                    scrollDirection: Axis.vertical,
                    children: topics
                        .map((topic) => topicEntry(document: topic))
                        .toList()),
                onRefresh: () {
                  return Future.delayed(const Duration(seconds: 1), () {
                    _singleton.refreshing = true;
                    setState(() {});
                  });
                },
              ),
            );

            // return Flexible(
            //     child: GridView.count(
            //   childAspectRatio: (5 / 1),
            //   crossAxisCount: 1,
            //   crossAxisSpacing: 10.0,
            //   mainAxisSpacing: 10.0,
            //   shrinkWrap: true,
            //   children:
            //       topics.map((topic) => topicEntry(document: topic)).toList(),
            // ));
          },
        ),
      ]),
      bottomNavigationBar: navigationBar(index: 0),
    );
  }
}
