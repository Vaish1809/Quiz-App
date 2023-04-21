//thsi stores blueprint or propeties of questions questions its options and correct and and we will import this to our question screen  
class QuizQuestion {
  const QuizQuestion(this.text,this.answers);//this is the constructor which creates objects having properties similar to the properties of class 
  final String text;//the question
  final List<String> answers;
  //the answers(all possible options where my ist option is the ans but we will jumble it and display)

//to shuffle the answers
//shuffle unlike map changes the list so we need to create a copy of list then add shuffle to it and reutrn that list

List<String> getShuffledAnswers(){
  final shuffledList = List.of(answers);//here list is a class which has ertain fucntion like here .of will create a copy of the original list asnwers and store it in shuffled list 
  //here final means we cannot change the values of our lsit ie in the code later we cannot reassign any values to shuffled list like
  //shuffledList="hello";this is wrong not possible due to final
  //shuffle doesnt reassign value it instead creates a new list and adds in shuffled values directly
  shuffledList.shuffle(); //here the copy of list which is shuffledlist will get shuffled values due to .shuffle
  return shuffledList;//since this is a method and the method returns a string we return our list of shuffledanswers

}


}


