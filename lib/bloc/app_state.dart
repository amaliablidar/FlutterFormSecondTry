part of 'app_bloc.dart';

enum AppStatus { initial, success, failure, submitted, next }

class AppState extends Equatable{
  const AppState({
    this.status = AppStatus.initial,
    this.questionList=const <Question>[],
  });

  final AppStatus status;
  final List<Question> questionList;

  AppState copyWith({
    AppStatus? status,
    List<Question>? questions,
  }) {
    return AppState(
      status: status ?? this.status,
      questionList: questions ?? questionList,
    );
  }

  @override
  List<Object?> get props => [status,questionList];
}

