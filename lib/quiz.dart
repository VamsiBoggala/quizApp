import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions; // collecting the questions asa list through mapping main screen
  final int questionIndex;
  final Function answerQuestion;
  // consructor for possestion arguments to collect data from previuos scren
  Quiz(
      {@required this.answerQuestion,
      @required this.questions,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // the widget we passing questions by thier index number through question widget
        Question(
          questions[questionIndex]['questionText'],
        ),
        // this is a mapping to tranfer answers and their scores through Answer widget, by passing clicking the answer button
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);// here we passing the answer and text
        }).toList()
      ],
    );
  }
}
