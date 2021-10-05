import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Result extends StatelessWidget {

  // intitialize the variables for getting values from main screen
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);
  
  // write if condition to display the message based on the resultScore
  String get resultPhrase {
    var resultText = 'You Did It!';
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... Strange!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // display the result screen
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          // the button using to restart the quiz
          TextButton(
            child: const Text('Restart Quiz!'),
            onPressed: resetQuiz,
          )
        ],
      ),
    );
  }
}
