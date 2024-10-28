part of 'qaho_bloc.dart';

@immutable
sealed class QahoEvent {}

final class AskQuestion extends QahoEvent {
  final Question question;
  AskQuestion({required this.question});
}

final class HistoryRetrive extends QahoEvent {
  final HistoryDetails historyDetails;

  HistoryRetrive({required this.historyDetails});

}
