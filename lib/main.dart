import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp_part2/bloc/app_bloc.dart';
import 'package:formapp_part2/presentation/screens/home_screen.dart';
import 'package:formapp_part2/presentation/screens/submit_screen.dart';
import 'package:provider/provider.dart';
import 'dataProvider/answers.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider<AppBloc>(
      create: (_) => AppBloc()..add(QuestionFetched()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.brown,
        ),
        routes: {
          '/':(context)=> HomeScreen(),
          SubmitScreen.route: (context)=> const SubmitScreen(),

        },
      ),
    );
  }
}