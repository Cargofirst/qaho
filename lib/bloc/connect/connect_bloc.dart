import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../api/qaho_api.dart';
import '../../model/message.dart';

part 'connect_event.dart';
part 'connect_state.dart';

class ConnectBloc extends Bloc<ConnectEvent, ConnectState> {
  ConnectBloc() : super(ConnectInitial()) {
    on<Connect>((event, emit) async {
      if (state is ConnectionSuccess || state is ConnectionLoading) {
        return;
      }
      emit(ConnectionLoading());
      try {
        final Response response = await QahoApi().connect();
        if (response.statusCode == 200) {
          emit(ConnectionSuccess(message: Message.fromJson(response.body)));
        } else {
          emit(ConnectionFailure(error: 'Failed connecting to server'));
        }
      } catch (e) {
        emit(ConnectionFailure(error: e.toString()));
      }
    });
  }

  // @override
  // void onChange(Change<ConnectState> change) {
  //   if (kDebugMode) {
  //     print(change);
  //   }
  //   super.onChange(change);
  // }

  // @override
  // void onTransition(Transition<ConnectEvent, ConnectState> transition) {
  //   if (kDebugMode) {
  //     print(transition);
  //   }
  //   super.onTransition(transition);
  // }
}
