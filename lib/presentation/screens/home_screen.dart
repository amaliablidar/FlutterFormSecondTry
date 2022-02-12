import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp_part2/bloc/app_bloc.dart';
import 'package:formapp_part2/presentation/screens/submit_screen.dart';
import 'package:formapp_part2/presentation/widgets/initial_widget.dart';
import 'package:formapp_part2/presentation/widgets/succes_state_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _controller = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  int currentPage = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
        ),
        body: BlocConsumer<AppBloc, AppState>(listener: (context, state) {
          if (state.status == AppStatus.submitted) {
            Navigator.of(context).pushReplacementNamed(SubmitScreen.route);
          }
          if(state.status==AppStatus.next){
            _controller.nextPage(duration: _kDuration, curve: _kCurve);
            context.read<AppBloc>().add(QuestionFetched());
          }
          if(state.status==AppStatus.prev){
            _controller.previousPage(duration: _kDuration, curve: _kCurve);
            context.read<AppBloc>().add(QuestionFetched());
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
            case AppStatus.failure:
              return const Center(child: Text('Failed'));
            default:
              return const Text('Something');
          }
        }));
  }
}
