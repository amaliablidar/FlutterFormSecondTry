import 'package:flutter/material.dart';
import 'package:formapp_part2/bloc/app_bloc.dart';
import 'package:formapp_part2/dataProvider/model/question.dart';
import 'package:provider/src/provider.dart';

class QuestionWidgetNumber extends StatefulWidget {
  const QuestionWidgetNumber(
      {Key? key,
      required this.question,
      required this.controller,
      required this.last})
      : super(key: key);

  final Question question;
  final PageController controller;
  final bool last;

  @override
  State<QuestionWidgetNumber> createState() => _QuestionWidgetNumberState();
}

class _QuestionWidgetNumberState extends State<QuestionWidgetNumber> {
  final _controller = TextEditingController();
  late String answer;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  bool _valid = true;

  bool checkDouble(String value) {
    try {
      double.parse(value);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.question.question,
            style: const TextStyle(fontSize: 25),
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal:true),
            controller: _controller,
            decoration: InputDecoration(
                labelText: ('Enter your answer here'),
                errorText: _valid ? null : 'Answer must be number'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<AppBloc>().add(PrevButtonPressed());

                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(220, 174, 150, 100),
                  )),
                  child: const Text('Prev')),
              widget.last
                  ? ElevatedButton(
                      onPressed: () {
                        if (checkDouble(_controller.text) == true) {
                          setState(() {
                            _valid = true;
                          });
                        } else {
                          setState(() {
                            _valid = false;
                          });
                        }
                        if (_valid == true) {
                          context.read<AppBloc>().add(FormSubmitted());
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(220, 174, 150, 100),
                      )),
                      child: const Text('Submit'))
                  : ElevatedButton(
                      onPressed: () {
                        if (checkDouble(_controller.text) == true) {
                          setState(() {
                            _valid = true;
                          });
                        } else {
                          setState(() {
                            _valid = false;
                          });
                        }
                        if (_valid == true) {
                          context.read<AppBloc>().add(NextButtonPressed());

                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(220, 174, 150, 100),
                      )),
                      child: const Text('Next')),
            ],
          ),
        ),
      ],
    );
  }
}
