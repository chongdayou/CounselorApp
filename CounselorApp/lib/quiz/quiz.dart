import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:helloworld/services/services.dart';
import 'package:helloworld/shared/shared.dart';
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
                    title: const Text("Intro Quiz"),
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
                        return EndPage(quiz: quiz);
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
    return Container();
  }
}

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key, required this.question});
  final Question question;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return Container();
  }
}

class EndPage extends StatelessWidget {
  const EndPage({super.key, required this.quiz});
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
