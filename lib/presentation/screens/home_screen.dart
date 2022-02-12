import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp_part2/bloc/app_bloc.dart';
import 'package:formapp_part2/presentation/screens/submit_screen.dart';
import 'package:formapp_part2/presentation/widgets/initial_widget.dart';
import 'package:formapp_part2/presentation/widgets/question_widget.dart';
import 'package:formapp_part2/presentation/widgets/succes_state_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _kDuration = Duration(milliseconds: 300);
    const _kCurve = Curves.ease;
    final _controller = PageController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              _controller.previousPage(duration: _kDuration, curve: _kCurve);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                _controller.nextPage(duration: _kDuration, curve: _kCurve);
              },
            ),
          ],
        ),
        body: BlocConsumer<AppBloc, AppState>(listener: (context, state) {
          if (state.status == AppStatus.submitted) {
            Navigator.of(context).pushReplacementNamed(SubmitScreen.route);
          }
        }, builder: (context, state) {
          switch (state.status) {
            case AppStatus.initial:
              print(state.status);
              return const InitialWidget();
            case AppStatus.success:
              print(state.status);
              return BlocProvider.value(
                value: context.read<AppBloc>(),
                child: SuccesStateWidget(
                  controller: _controller,
                  list: state.questionList,
                  length: state.questionList.length,
                ),
              );
              break;
            case AppStatus.failure:
              print(state.status);
              return const Center(child: Text('Failed'));
            case AppStatus.submitted:
              // TODO: Handle this case.
              break;

            default:
              break;
          }
          return const Text('text');
        }));
  }
}
