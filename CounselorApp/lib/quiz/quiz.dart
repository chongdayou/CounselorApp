import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:helloworld/services/services.dart';
import 'package:helloworld/shared/shared.dart';
import 'package:helloworld/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'quizstate.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => QuizState(),
        child: FutureBuilder<Quiz>(
            future: FirestoreServices().getQuiz('intro_recommendations'),
            builder: (context, snapshot) {
              var state = Provider.of<QuizState>(context);

              if (!snapshot.hasData || snapshot.hasError) {
                return const LoadingScreen();
              } else {
                var quiz = snapshot.data!;

                return Scaffold(
                  appBar: AppBar(
                    title: const Text("Welcome"),
                    leading: IconButton(
                      icon: const Icon(FontAwesomeIcons.xmark),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  body: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    controller: state.controller,
                    onPageChanged: (int idx) =>
                        state.progress = (idx / (quiz.questions.length + 1)),
                    itemBuilder: (BuildContext context, int idx) {
                      if (idx == 0) {
                        return StartPage(quiz: quiz);
                      } else if (idx == quiz.questions.length + 1) {
                        // print("TESTING: ${state.preferences}");
                        return EndPage(preferences: state.preferences);
                      } else {
                        return QuestionPage(question: quiz.questions[idx - 1]);
                      }
                    },
                  ),
                );
              }
            }));
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key, required this.quiz});
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(quiz.title, style: const TextStyle(fontSize: 36)),
            const Divider(),
            const SizedBox(
              height: 40,
            ),
            Expanded(
                child: Text(
              quiz.description,
              style: const TextStyle(fontSize: 20),
            )),
            SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 95,
                height: 50,
                child: ElevatedButton(
                    onPressed: state.nextQuestion,
                    child: const Text('Start Quiz!',
                        style: TextStyle(fontSize: 30)))),
          ],
        ));
  }
}

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key, required this.question});
  final Question question;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: SizedBox(
              width: SizeConfig.blockSizeHorizontal! * 90,
              child: Text(question.text, style: const TextStyle(fontSize: 30))),
        )),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: question.options.map((opt) {
                return Container(
                  height: 90,
                  margin: const EdgeInsets.only(bottom: 10),
                  color: Colors.black26,
                  child: InkWell(
                    onTap: () {
                      state.selected = opt;
                      preferenceBuilder(context, opt, state);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(
                              state.selected == opt
                                  ? FontAwesomeIcons.circleCheck
                                  : FontAwesomeIcons.circle,
                              size: 30),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              child: Text(
                                opt.value,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList()),
        )
      ],
    );
  }

  preferenceBuilder(BuildContext context, Option opt, QuizState state) {
    // add on to the preference payload here
    print(state.preferences);
    opt.weights.forEach((key, value) {
      state.preferences
          .update(key, (current) => current + value, ifAbsent: () => value);
    });

    state.nextQuestion();
  }
}

class EndPage extends StatelessWidget {
  const EndPage({super.key, required this.preferences});
  final Map<String, double> preferences;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Thank you! You have now unlocked the ForYou screen!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 36),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton.icon(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(24),
            backgroundColor: Colors.green,
          ),
          icon: const Icon(FontAwesomeIcons.check),
          label: const Text(' Mark Complete!'),
          onPressed: () {
            // Write the permissions onto the user data
            FirebaseFirestore.instance
                .collection('user_data')
                .doc(Auth().user!.uid)
                .update({"preferences": preferences}).then(
                    (value) => Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/forYouScreen',
                          ModalRoute.withName('/initialization'),
                        ));

            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   '/forYouScreen',
            //   ModalRoute.withName('/initialization'),
            // );
          },
        )
      ]),
    );
  }
}
