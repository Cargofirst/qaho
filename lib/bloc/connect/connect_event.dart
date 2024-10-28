part of 'connect_bloc.dart';

@immutable
sealed class ConnectEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class Connect extends ConnectEvent {}
