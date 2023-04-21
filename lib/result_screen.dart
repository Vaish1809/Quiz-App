import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAsnwers});
  final List<String> chosenAsnwers;

  //map is like dictionary in python it mapss keps to values
  // map has keys an va;ues corresponding to it
  //datatype of keys is string and values is int +string hence we write it as object which is generic
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAsnwers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAsnwers,
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData =getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions =summaryData.where((data){
      return data["user_answer"]==data["correct_answer"];
    }).length;
    return SizedBox(
      width: double.infinity, //inbuilt in dart which says use maximum space
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("You have answered $numCorrectQuestions out of $numTotalQuestions correctly"),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
           const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
