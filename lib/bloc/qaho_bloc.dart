import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaho/api/qaho_api.dart';
import 'package:qaho/model/chat.dart';
part 'qaho_event.dart';
part 'qaho_state.dart';

class QahoBloc extends Bloc<QahoEvent, QahoState> {
  QahoBloc() : super(QahoInitial()) {
    on<AskQuestion>((event, emit) async {
      emit(QahoLoading());
      final Question question = event.question;

      try {
        final Response response = await QahoApi().call(question: question);
        if (response.statusCode == 200) {
          emit(QahoSuccess(response: response));
        } else {
          emit(QahoFailure(error: 'Failed connecting to server'));
        }
      } catch (e) {
        emit(QahoFailure(error: e.toString()));
      }
    });
  }

  @override
  void onChange(Change<QahoState> change) {
    if (kDebugMode) {
      print(change);
    }
    super.onChange(change);
  }

  @override
  void onTransition(Transition<QahoEvent, QahoState> transition) {
    if (kDebugMode) {
      print(transition);
    }
    super.onTransition(transition);
  }
}
