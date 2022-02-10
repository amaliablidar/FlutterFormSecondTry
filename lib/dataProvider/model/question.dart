enum AnswerType { int, string, double, bool, dropdown, multiple }

class Question {
  Question({
    required this.question,
    required this.answerType,
    this.possibleAnswers,
  });

  final String question;
  final AnswerType answerType;
  final List<String>? possibleAnswers;

}
