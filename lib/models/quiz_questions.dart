//thsi stores blueprint or propeties of questions questions its options and correct and and we will import this to our question screen  
class QuizQuestion {
  const QuizQuestion(this.text,this.answers);//this is the constructor which creates objects having properties similar to the properties of class 
  final String text;//the question
  final List<String> answers;//the answers(all possible options where my ist option is the ans but we will jumble it and display)
}