import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  //method1
 const AnswerButton({required this.answerText,required this.onTap,super.key});
//method 2 
//const AnswerButton(this.answerText,this.onTap,{super.key});
final String answerText;
final void Function() onTap;
@override
Widget build(context){
  return  ElevatedButton(
            onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
            backgroundColor:const  Color.fromARGB(255, 78, 26, 94),
            foregroundColor: Colors.white,//textcolor
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
          child : Text(answerText,textAlign: TextAlign.center),
          );
}
}