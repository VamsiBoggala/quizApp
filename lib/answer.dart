import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Answer extends StatelessWidget {
  // this the variables collect the values from quiz widget
  final VoidCallback selectHandler;
  final String answerText;

  // ignore: use_key_in_widget_constructors
  const Answer(
    this.selectHandler,
    this.answerText,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // the button is used for display the answers
      // and to collect the score based on the answers
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
