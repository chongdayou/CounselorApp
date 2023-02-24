import 'package:flutter/material.dart';
import 'package:helloworld/shared/bottomBar.dart';
import 'package:helloworld/size_config.dart';
import 'package:helloworld/services/singleton.dart';
import 'package:helloworld/screens/topic.dart';
import 'package:helloworld/quiz/quiz.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

class ForYouScreen extends StatelessWidget {
  ForYouScreen({super.key});

  Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    if (_singleton.userData != null &&
        _singleton.userData!.containsKey("preferences")) {
      // if the user already has preference parameters set
      print("The user has preferences set!");
    } else if (_singleton.userData != null) {
      // send them to the recommendation quiz!
      print("The user does not have preferences set!");
      // Navigator.pushNamed(context, '/quizScreen');
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (BuildContext context) => QuizScreen(),
      // ));
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
