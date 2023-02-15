import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[800],
          title: Text(
            'Quizzler',
            style: TextStyle(
              fontFamily: 'EuropaNuova',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //TODO: Questions
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                // 'All Your Questions Goes Here',
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'EuropaNuova',
                  fontSize: 23,
                ),
              ),
            ),
          ),
        ),
        //TODO: True Button
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'EuropaNuova',
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quizBrain.getCorrectAnswer();
                if (correctAnswer == true) {
                  print('User got it right!');
                } else {
                  print('User got it wrong');
                }
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        //TODO: False Button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'EuropaNuova',
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              onPressed: () {
                //User picks False
                bool correctAnswer = quizBrain.getCorrectAnswer();
                if (correctAnswer == false) {
                  print('User got it right!');
                } else {
                  print('User got it wrong');
                }
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10),
          child: Row(
            children: scorKeeper,
          ),
        ),
      ],
    );
  }
}
