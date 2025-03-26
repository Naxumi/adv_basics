import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

// List<Widget> lists = [AnswerButton(answerText: 'answerText', onTap: () {}), AnswerButton(answerText: 'answerText', onTap: () {}), AnswerButton(answerText: 'answerText', onTap: () {})];

class _QuestionScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion() {
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;  
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: answerQuestion);
            }),
          ],
        ),
      ),
    );
  }
}
