import 'package:flutter/material.dart';
import 'package:formapp_part2/bloc/app_bloc.dart';
import 'package:formapp_part2/dataProvider/model/question.dart';
import 'package:provider/src/provider.dart';

class QuestionWidgetString extends StatefulWidget {
  const QuestionWidgetString(
      {Key? key,
      required this.question,
      required this.controller,
      required this.last})
      : super(key: key);
  final Question question;
  final PageController controller;
  final bool last;

  @override
  _QuestionWidgetStringState createState() => _QuestionWidgetStringState();
}

class _QuestionWidgetStringState extends State<QuestionWidgetString> {
  final _controller = TextEditingController();
  bool _valid = true;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  late String answer;

  bool checkString(String value) {
    if (value.isEmpty) {
      return false;
    }
    bool found = value.contains(RegExp(r'[0-9]'));
    return !found;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
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
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                labelText: ('Enter your answer here'),
                errorText: _valid ? null : 'Answer must be text'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    widget.controller
                        .previousPage(duration: _kDuration, curve: _kCurve);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(220, 174, 150, 100),
                  )),
                  child: const Text('Prev')),
              widget.last
                  ? ElevatedButton(
                      onPressed: () {
                        if (checkString(_controller.text) == true) {
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
                        if (checkString(_controller.text) == true) {
                          setState(() {
                            _valid = true;
                          });
                        } else {
                          setState(() {
                            _valid = false;
                          });
                        }
                        if (_valid == true) {
                          widget.controller
                              .nextPage(duration: _kDuration, curve: _kCurve);
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
