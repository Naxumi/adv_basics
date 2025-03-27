// import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return StyledSummary(questionIndex: (((data['question_index'] as int) + 1).toString()), question: data['question'] as String, userAnswer: data['user_answer'] as String, correctAnswer: data['correct_answer'] as String);
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Container(
                //       width: 30,
                //       height: 30,
                //       alignment: Alignment.center,
                //       decoration: BoxDecoration(
                //         color: Colors.amber,
                //         borderRadius: BorderRadius.circular(100),
                //       ),
                //       margin: EdgeInsets.only(right: 16),
                //       child: Text(
                //         ((data['question_index'] as int) + 1).toString(),
                //       ),
                //     ),
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.stretch,
                //         children: [
                //           Text(
                //             data['question'] as String,
                //             style: GoogleFonts.lato(
                //               color: Color.fromARGB(255, 237, 223, 252),
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           SizedBox(height: 5),
                //           Text(data['user_answer'] as String),
                //           Text(data['correct_answer'] as String),
                //         ],
                //       ),
                //     ),
                //   ],
                // );
              }).toList(),
        ),
      ),
    );
  }
}

class StyledSummary extends StatelessWidget {
  const StyledSummary({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
  });

  final String questionIndex;
  final String question;
  final String userAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    Color colorInUse;

    final Color colorCorrect = const Color.fromARGB(255, 153, 178, 251);
    final Color colorFalse = const Color.fromARGB(255, 201, 153, 251);
    if (userAnswer == correctAnswer) {
      colorInUse = colorCorrect;
    } else {
      colorInUse = colorFalse;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colorInUse,
            borderRadius: BorderRadius.circular(100),
          ),
          margin: EdgeInsets.only(right: 16),
          child: Text(questionIndex),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question,
                style: GoogleFonts.lato(
                  color: colorInUse,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                userAnswer,
                style: GoogleFonts.lato(
                  color: colorFalse,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                correctAnswer,
                style: GoogleFonts.lato(
                  color: colorCorrect,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
