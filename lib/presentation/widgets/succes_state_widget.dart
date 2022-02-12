import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp_part2/bloc/app_bloc.dart';
import 'package:formapp_part2/dataProvider/model/question.dart';
import 'package:formapp_part2/presentation/widgets/question_widget.dart';

class SuccessStateWidget extends StatefulWidget {
  const SuccessStateWidget(
      {Key? key,
      required this.controller,
      required this.list,
      required this.length})
      : super(key: key);
  final PageController controller;
  final List<Question> list;
  final int length;

  @override
  _SuccessStateWidgetState createState() => _SuccessStateWidgetState();
}

class _SuccessStateWidgetState extends State<SuccessStateWidget> {
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (index) {
        if (index == widget.length - 1) {
          setState(() {
            lastPage = true;
          });
        }
      },
      controller: widget.controller,
      itemBuilder: (context, position) {
        return BlocProvider.value(
            value: context.read<AppBloc>(),
            child: QuestionWidget(
                question: widget.list[position],
                controller: widget.controller,
                lastPage: lastPage));
      },
      itemCount: widget.list.length, // Can be null
    );
  }
}
