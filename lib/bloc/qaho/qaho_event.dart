part of 'qaho_bloc.dart';

@immutable
sealed class QahoEvent {}

final class AskQuestion extends QahoEvent {
  final Question question;
  AskQuestion({required this.question});

  // @override
  // List<Object?> get props => [question];
}
