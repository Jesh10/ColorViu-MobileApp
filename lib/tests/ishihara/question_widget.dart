import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
    {Key? key,
    required this.indexAction,
    required this.totalQuestions})
    : super(key: key);

    final int indexAction;
    final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
        child: Text(
            'Question ${indexAction + 1}/$totalQuestions',
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white
            ), 
          ),
      ),
    );
  }
}