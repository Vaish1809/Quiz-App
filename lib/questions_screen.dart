import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectAnswer});
 final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex =0;
  void answerQuestion( String selectedAnswer )
  {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // currentQuestionIndex = currentQuestionIndex+1;
    //currentQuestionIndex+=1;  
    currentQuestionIndex++;
    });
    
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity, //inbuilt in dart which says use maximum space
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //padding is the space between test and the outermost part of a button
          //margin is the space between butons
          children:  [
            Text(currentQuestion.text,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 196, 180, 239),
              fontWeight: FontWeight.bold

            ),
              textAlign:TextAlign.center,
              ),
             
            const SizedBox(height: 30),
        ...currentQuestion.getShuffledAnswers().map((answer){//take all valeus in list pull them out and make them to individual csv 
          return AnswerButton( 
            answerText: answer,
              onTap: (){
                answerQuestion(answer);
              }
              );
        })//map is used to convert list to other values
        //map doesnt change th eoriginal list it makes a new list and both lists coexist together
        //map applies the function /method we put in to every value of answers list 
        //the current value or answer on which its working on is item adnit needs to be passed though the value of item changes dynamically
           
          
          ],
        ),
      ),
    );
  }
}
