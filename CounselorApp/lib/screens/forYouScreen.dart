import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:helloworld/size_config.dart';
import 'package:helloworld/services/singleton.dart';
import 'package:helloworld/screens/topic.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

class ForYouScreen extends StatelessWidget {
  ForYouScreen({super.key});

  Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
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
                  child: const Text('New Activity +',
                      style: TextStyle(fontSize: 30)))),
          (_singleton.postsCache != null)
              ? Expanded(
                  child: ListView(
                  scrollDirection: Axis.vertical,
                  children:
                      _singleton.postsCache! // add the tag sorting logic here
                          .map((topic) => topicEntry(
                                document: topic,
                              ))
                          .toList(),
                ))
              : Container(),
        ],
      ),
      bottomNavigationBar: navigationBar(index: 1),
    );
  }
}
