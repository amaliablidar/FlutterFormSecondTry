import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formapp_part2/dataProvider/model/question.dart';
import 'package:formapp_part2/dataProvider/repository.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<QuestionFetched>(_onQuestionFetched);
    on<FormSubmitted>(_onFormSubmitted);
    on<NextButtonPressed>(_onNextButtonPressed);
    on<PrevButtonPressed>(_onPrevButtonPressed);
  }

  void _onQuestionFetched(QuestionFetched event, Emitter<AppState> emit) {
    try {
        final questionList = fetchQuestions();
        emit(AppState(
          status: AppStatus.success,
          questionList: questionList,
        ));

    } catch (_) {
      emit(const AppState(status: AppStatus.failure));
    }
  }

  void _onFormSubmitted(FormSubmitted event, Emitter<AppState> emit) {
    emit(const AppState(
      status: AppStatus.submitted,
    ));
  }

  void _onNextButtonPressed(NextButtonPressed event, Emitter<AppState> emit) {
    emit(const AppState(
      status: AppStatus.next,
    ));
  }

  void _onPrevButtonPressed(PrevButtonPressed event, Emitter<AppState> emit) {
    emit(const AppState(
      status: AppStatus.prev,
    ));
  }

  List<Question> fetchQuestions() {
    Repository repo = Repository();
    return repo.questionList;
  }
}
