import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formapp_part2/bloc/app_bloc.dart';
import 'package:formapp_part2/dataProvider/model/question.dart';
import 'package:provider/src/provider.dart';

class QuestionWidgetMultiple extends StatefulWidget {
  const QuestionWidgetMultiple(
      {Key? key,
      required this.question,
      required this.controller,
      required this.last})
      : super(key: key);
  final PageController controller;
  final Question question;
  final bool last;

  @override
  _QuestionWidgetMultipleState createState() => _QuestionWidgetMultipleState();
}

class _QuestionWidgetMultipleState extends State<QuestionWidgetMultiple> {
  late Question questionLocal;
  late String dropdownValue;
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  late String answer;

  @override
  void initState() {
    questionLocal = widget.question;
    dropdownValue = questionLocal.possibleAnswers![0];
    super.initState();
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
          child: DropdownButton<String>(
            alignment: Alignment.center,
            value: dropdownValue,
            icon: const Icon(
              Icons.arrow_circle_down,
              color: Color.fromRGBO(183, 65, 14, 100),
            ),
            elevation: 16,
            style: const TextStyle(
              color: Color.fromRGBO(183, 65, 14, 100),
            ),
            underline: Container(
              height: 2,
              color: const Color.fromRGBO(220, 174, 150, 100),
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                answer = dropdownValue;
              });
            },
            items: questionLocal.possibleAnswers
                ?.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  textAlign: TextAlign.justify,
                ),
              );
            }).toList(),
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
                        context.read<AppBloc>().add(FormSubmitted());
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(220, 174, 150, 100),
                      )),
                      child: const Text('Submit'))
                  : ElevatedButton(
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
        ),
      ],
    );
  }
}
