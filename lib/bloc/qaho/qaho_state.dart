part of 'qaho_bloc.dart';

abstract class QahoState {
  const QahoState(this.chat);
  final List<Chat> chat;
}

class QahoInitial extends QahoState {
  QahoInitial() : super([]);
}

class QahoHistoryInitial extends QahoState {
  QahoHistoryInitial(super.chat);
}
class QahoLoading extends QahoState {
  const QahoLoading(super.chat);
}

class QahoFailure extends QahoState {
  final String error;
  const QahoFailure(super.chat, {required this.error});
}

class QahoSuccess extends QahoState {
  @override
  const QahoSuccess({required List<Chat> chat}) : super(chat);
}
