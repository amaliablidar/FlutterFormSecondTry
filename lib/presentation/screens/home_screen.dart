import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp_part2/bloc/app_bloc.dart';
import 'package:formapp_part2/presentation/screens/submit_screen.dart';
import 'package:formapp_part2/presentation/widgets/initial_widget.dart';
import 'package:formapp_part2/presentation/widgets/succes_state_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = PageController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
        ),
        body: BlocConsumer<AppBloc, AppState>(listener: (context, state) {
          if (state.status == AppStatus.submitted) {
            Navigator.of(context).pushReplacementNamed(SubmitScreen.route);
          }
        }, builder: (context, state) {
          switch (state.status) {
            case AppStatus.initial:
              return const InitialWidget();
            case AppStatus.success:
              return BlocProvider.value(
                value: context.read<AppBloc>(),
                child: SuccessStateWidget(
                  controller: _controller,
                  list: state.questionList,
                  length: state.questionList.length,
                ),
              );
              break;
            case AppStatus.failure:
              return const Center(child: Text('Failed'));
            default:
              break;
          }
          return const Text('text');
        }));
  }
}
