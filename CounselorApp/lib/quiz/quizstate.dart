import 'package:flutter/material.dart';
import 'package:helloworld/services/models.dart';

class QuizState with ChangeNotifier {
  double _progress = 0;
  Option? _selected;

  final PageController controller = PageController();

  double get progress => _progress;
  Option? get selected => _selected;

  set progress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  set selected(Option? newValue) {
    _selected = newValue;
    notifyListeners();
  }

  void nextQuestion() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
