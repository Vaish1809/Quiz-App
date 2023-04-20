import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

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

  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override

  Widget build(context) {
    //METHOD 1 USING TERNARY OPERATOR
    // final screenWidget = activeScreen == 'start-screen' 
    //         ? StartScreen(switchScreen) 
    //         : const QuestionsScreen(); 

    //METHOD 2 USING IF ELSE
    Widget screenWidget = StartScreen(switchScreen);
    if(activeScreen == 'question-screen')
    {
          screenWidget=const QuestionsScreen(); 
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
     child: screenWidget
      ),
    ) //adds ui
        );
  }
}
