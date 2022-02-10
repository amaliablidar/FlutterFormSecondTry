import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp_part2/bloc/app_bloc.dart';
import 'package:formapp_part2/presentation/widgets/initial_widget.dart';
import 'package:formapp_part2/presentation/widgets/question_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Form')),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        switch (state.status) {
          case AppStatus.initial:
            return const InitialWidget();
          case AppStatus.success:
            return PageView.builder(
              controller: _controller,
              itemBuilder: (context, position) {
                return BlocProvider.value(value: context.read<AppBloc>(),child: QuestionWidget(question:state.questionList[position],controller:_controller));
              },
              itemCount: state.questionList.length, // Can be null
            );
            break;
          case AppStatus.failure:
            return const Center(child:Text('Failed'));
          case AppStatus.submitted:
            // TODO: Handle this case.
            break;
          case AppStatus.next:
            // TODO: Handle this case.
            break;
          default:
            break;
        }
        return const Text('something');
      },
      ),
    );
  }
}
