import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity:0.6,
          //   child: Image.asset(
          //     'assets/assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          Image.asset(
            'assets/assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(205, 255, 255, 255),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Fun Way To Learn Flutter",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed:
                startQuiz, //onPressed wants a function but startQuiz is already a function hence we can use it
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
