import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/models/quiz_questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//setstate reruns build method and updates the ui
class _QuizState extends State<Quiz> {
  //method 1 using init state
//   Widget? activeScreen;//here Switch Screen and
//   @override
//   void initState(){//executes only once
// activeScreen = StartScreen(switchScreen);//without init the changes / connection btween active screen and void switch screen is too fast
//   super.initState();
//   }
//
//method 2 using strings
  // void switchScreen(){
  //   setState(() {
  //      activeScreen = const QuestionsScreen();//rendering content conditionally
  //   });

//next IMPORTANT THING
//here we need to store the answers selected by user and display into the final result page
//to do so we need to store the info present in the question screen and the result
//so here this page which is quiz.dart has the acess to the question screen as well as the result therefore we lift the stare up
//lifitng the state up-creating a new state which acess both result and question
  List<String> selectedAnswers = []; //this is a list of strings
  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer); //it doesnt reassign it adds the existing lsit to memeory
    if (selectedAnswers.length == questions.length) {
      setState(() {
       // selectedAnswers = []; //this is done so thhat once the quiz is played we set the answer to 0 so it can restart the quiz again
        //we remove this later because then our selected ans dont sotre and display
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(context) {
    //METHOD 1 USING TERNARY OPERATOR
    // final screenWidget = activeScreen == 'start-screen'
    //         ? StartScreen(switchScreen)
    //         : const QuestionsScreen();

    //METHOD 2 USING IF ELSE
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == "results-screen") {
      screenWidget =  ResultsScreen(chosenAsnwers: selectedAnswers);
    }
    return MaterialApp(
        //MaterialApp basic screen
        home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 20, 39, 143),
                Color.fromARGB(255, 52, 101, 208)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen == 'start-screen' //here == is comparator whereas = is assigning a value || == chks if equal then reutrns true
          //     ? StartScreen(switchScreen) // if condition
          //     : const QuestionsScreen(), //else condiiton
          child: screenWidget),
    ) //adds ui
        );
  }
}
