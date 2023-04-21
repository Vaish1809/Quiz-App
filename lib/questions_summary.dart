import 'package:flutter/material.dart';
import 'package:quiz_app/result_screen.dart';
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          //here children only accepts widgets and not lists therefore we change the type by using map function
          children: summaryData.map((data) {
            return Row(
              children: [
                //here we use the data we stored in "question_index"which is the question index
                //but the question index starts from 0 but we dont want to print 0 we wantt o add 1 so we do +1
                //but we used map <String,Object> hence dart doesnt know list["quesiton"] is int or string
                //therefore we convert it to integer hence used typecasting ((valueto be  converted) as datatype )
                //now as we do this Text only acccepts string but we have an int value therefore do .toString()
                //children needs a list but we entered only text which is string therefore to convert it to list do .toList()
                Text(((data['question_index'] as int) + 1).toString()),
          //expanded widget - it takes all the space it gets
          //it takes all the space that the widget abv it takes so for here it will take all the space which row widget will take ie. the max widht of screen
                Expanded(
                  child: Column(
                    children: [
                      Text(data["question"] as String),
                   const SizedBox(
                    height: 5,
                   ),
                   Text(data["user_answer"] as String),
                   Text(data["correct_answer"] as String),
                    ],
                  ),
                ),
              ],
            );
          },).toList(),
        ),
      ),
    );
  }
}

/// List<Map<String, Object>> getSummaryDate() {
// final List<Map<String, Object>> summary = [];
