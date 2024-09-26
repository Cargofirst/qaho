part of 'connect_bloc.dart';

@immutable
sealed class ConnectState {}

final class ConnectInitial extends ConnectState {}

final class ConnectionLoading extends ConnectState {}

final class ConnectionSuccess extends ConnectState {
  final Message message;
  ConnectionSuccess({required this.message});
}

final class ConnectionFailure extends ConnectState {
  final String error;
  ConnectionFailure({required this.error});
}
