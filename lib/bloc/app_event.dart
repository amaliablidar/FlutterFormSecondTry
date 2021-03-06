part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class QuestionFetched extends AppEvent {}

class FormSubmitted extends AppEvent {}

class NextButtonPressed extends AppEvent {}

class PrevButtonPressed extends AppEvent {}
