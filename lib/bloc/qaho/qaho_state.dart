part of 'qaho_bloc.dart';

abstract class QahoState {
  const QahoState(this.chat);

  final List<Chat> chat;

  // @override
  // List<Object> get props => [];
}

class QahoInitial extends QahoState {
  QahoInitial() : super([]);
}

class QahoLoading extends QahoState {
  const QahoLoading(super.chat);
}

class QahoFailure extends QahoState {
  final String error;

  const QahoFailure(super.chat, {required this.error});

  // @override
  // List<Object> get props => [error];
}

class QahoSuccess extends QahoState {
  @override
  const QahoSuccess({required List<Chat> chat}) : super(chat);
}
