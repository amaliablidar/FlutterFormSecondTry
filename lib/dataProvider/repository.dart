import 'model/question.dart';

class Repository {
  final List<Question> _questionList = [
    Question(question: 'What\'s your name?', answerType: AnswerType.string),
    Question(question: 'How old are you?', answerType: AnswerType.int),

    Question(
        question: 'What is your favorite color?',
        answerType: AnswerType.multiple,
        possibleAnswers: ['red', 'blue', 'pink', 'yellow', 'orange']),
    Question(
        question: 'What was your main expense?',
        answerType: AnswerType.dropdown,
        possibleAnswers: ['Transport', 'Food', 'Medical', 'Rent']),
    Question(question: 'Do you like cats?', answerType: AnswerType.bool),
    Question(
        question: 'How much money did you spend today?',
        answerType: AnswerType.double),

  ];

  List<Question> get questionList {
    return _questionList;
  }
}
