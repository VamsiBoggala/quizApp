import 'package:flutter/material.dart';
import 'package:udemy_example/quiz.dart';
import 'package:udemy_example/result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // this is all the data we are passing through the screen
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];
  // here we declare the questionIndex,totalScore with the initial value '0'
  var _questionIndex = 0;
  var _totalScore = 0;
 // this is the method to reset the all values to normal means. restart the quiz
  void resetQuiz() {
    //this is the anonymous function to reset the screen
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  // here we are incrementing the score and questionIndex,
  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;
    // method for to replace the question following by questionIndex
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
          elevation: 0.0,
        ),
        // we apply the logic to disply the questions by their questionindex
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
              //we passing arguments, to the result screen
            : Result(
                _totalScore,
                resetQuiz,
              ),
      ),
    );
  }
}
