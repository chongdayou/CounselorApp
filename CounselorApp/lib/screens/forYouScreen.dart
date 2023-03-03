import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:helloworld/size_config.dart';
import 'package:helloworld/services/singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/screens/topic.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

class ForYouScreen extends StatelessWidget {
  ForYouScreen({super.key});

  final Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    var customLang = _singleton.preferences;
    List<topicEntry> sortedPosts = [];
    // setup sorted list of posts

    if (_singleton.tags.isEmpty) {
      final docRef = FirebaseFirestore.instance
          .collection("metadata")
          .doc("tags_repository");
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          List<String> tags = List<String>.from(data["tags"]);
          _singleton.tags = tags;
        },
        onError: (e) => print("Error getting document: $e"),
      );
    }

    if (_singleton.postsCache != null) {
      sortedPosts = _singleton.postsCache! // add the tag sorting logic here
          .map((topic) => topicEntry(
                document: topic,
              ))
          .toList();

      sortedPosts.sort(((a, b) => Sentiment.analysis(
              b.document["tags"].join(' '),
              customLang: customLang)
          .score
          .compareTo(Sentiment.analysis(a.document["tags"].join(' '),
                  customLang: customLang)
              .score)));
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: SizeConfig.blockSizeVertical! * 10),
          SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 95,
              height: 75,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/activityScreen');
                  },
                  child: const Text('Preferences',
                      style: TextStyle(fontSize: 30)))),
          (_singleton.postsCache != null)
              ? Expanded(
                  child: ListView(
                  scrollDirection: Axis.vertical,
                  children: sortedPosts,
                ))
              : Container(),
        ],
      ),
      bottomNavigationBar: navigationBar(index: 1),
    );
  }
}
