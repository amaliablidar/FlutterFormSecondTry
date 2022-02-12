import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp_part2/bloc/app_bloc.dart';
import 'package:formapp_part2/dataProvider/model/question.dart';
import 'package:formapp_part2/presentation/widgets/question_widget_bool.dart';
import 'package:formapp_part2/presentation/widgets/question_widget_multiple.dart';
import 'package:formapp_part2/presentation/widgets/question_widget_number.dart';
import 'package:formapp_part2/presentation/widgets/question_widget_string.dart';
import 'package:provider/src/provider.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key, required this.question,required this.controller,required this.lastPage}) : super(key: key);
  final Question question;
  final PageController controller;
  final bool lastPage;


  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {




  @override
  Widget build(BuildContext context) {

    switch (widget.question.answerType) {
      case AnswerType.int:
      case AnswerType.double:

        return QuestionWidgetNumber(question: widget.question,controller:widget.controller,last:widget.lastPage);


      case AnswerType.string:
        return QuestionWidgetString(question: widget.question,controller: widget.controller,last:widget.lastPage);

      case AnswerType.bool:
        return QuestionWidgetBool(question: widget.question,controller: widget.controller,last:widget.lastPage);



      case AnswerType.multiple:
      case AnswerType.dropdown:
      default:
        return QuestionWidgetMultiple(question:widget.question,controller:widget.controller,last:widget.lastPage);


    }
  }
}
