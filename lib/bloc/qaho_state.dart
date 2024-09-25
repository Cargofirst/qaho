part of 'qaho_bloc.dart';

@immutable
sealed class QahoState {}

final class QahoInitial extends QahoState {}

final class QahoLoading extends QahoState {}

class QahoSuccess extends QahoState {
  final Response response;

  QahoSuccess({required this.response});
}

final class QahoFailure extends QahoState {
  final String error;
  QahoFailure({required this.error});
}
