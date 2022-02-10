import 'package:flutter/material.dart';
import 'package:formapp_part2/dataProvider/answers.dart';
import 'package:formapp_part2/dataProvider/model/answer.dart';
import 'package:formapp_part2/dataProvider/model/question.dart';
import 'package:provider/provider.dart';

class QuestionWidgetBool extends StatefulWidget {
  const QuestionWidgetBool(
      {Key? key, required this.question, required this.controller})
      : super(key: key);
  final Question question;
  final PageController controller;

  @override
  _QuestionWidgetBoolState createState() => _QuestionWidgetBoolState();
}

class _QuestionWidgetBoolState extends State<QuestionWidgetBool> {
  bool _answer = true;
  bool _isPressedTrue = false;
  bool _isPressedFalse = false;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.question.question,
            style: const TextStyle(fontSize: 20),
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _answer = false;
                  _isPressedTrue = false;
                  _isPressedFalse = true;
                });
              },
              style: ButtonStyle(
                  backgroundColor: _isPressedFalse
                      ? MaterialStateProperty.all(const Color.fromRGBO(183,65,14,100))
                      : MaterialStateProperty.all(const Color.fromRGBO(220, 174, 150, 100)),
              ),
              child: const Text('No', style: TextStyle(color: Colors.black)),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  _answer = true;
                  _isPressedTrue = true;
                  _isPressedFalse = false;
                });
              },
              style: ButtonStyle(
                  backgroundColor: _isPressedTrue
                      ? MaterialStateProperty.all(const Color.fromRGBO(183,65,14,100))
                      : MaterialStateProperty.all(const Color.fromRGBO(220, 174, 150, 100))),
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
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
              ElevatedButton(
                  onPressed: () {

                    widget.controller
                        .nextPage(duration: _kDuration, curve: _kCurve);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(220, 174, 150, 100),
                  )),
                  child: const Text('Next')),
            ],
          ),
        )
      ],
    );
  }
}
