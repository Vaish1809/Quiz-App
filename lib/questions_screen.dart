import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity, //inbuilt in dart which says use maximum space
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Question1", style: TextStyle(color: Colors.white)),
          SizedBox(height: 30),
          AnswerButton(
            answerText: 'answer1',
            onTap: () {},
          ),
          AnswerButton(
            answerText: 'answer2',
            onTap: () {},
          ),
           AnswerButton(
            answerText: 'answer3',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
