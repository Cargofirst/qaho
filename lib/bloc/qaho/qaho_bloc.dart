import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaho/api/qaho_api.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:qaho/model/chat.dart';
part 'qaho_event.dart';
part 'qaho_state.dart';

class QahoBloc extends Bloc<QahoEvent, QahoState> {
  QahoBloc() : super(QahoInitial()) {
    on<AskQuestion>((event, emit) async {
      final Question question = event.question;

      // Emit initial human chat message
      Chat humanChat = Chat(
        message: question.question,
        type: Type.human,
        collectionName: question.collectionName,
        sessionId: question.sessionId,
      );
      state.chat.insert(0, humanChat);
      emit(QahoSuccess(chat: [...state.chat]));

      // Emit initial AI chat placeholder
      Chat aiChat = Chat(
        message: '',
        type: Type.ai,
        collectionName: question.collectionName,
        sessionId: question.sessionId,
      );
      state.chat.insert(0, aiChat);

      emit(QahoSuccess(chat: [...state.chat]));

      // Emit loading state
      emit(QahoLoading(state.chat));

      if (question.question.isEmpty) {
        emit(QahoFailure(state.chat, error: 'Question cannot be empty'));
        return;
      }

      try {
        final response = await QahoApi().call(question: question);

        if (response.statusCode == 200) {
          String message = '';
          // 'Try Gemini 1.5 models, the latest and most advanced multimodal models in Vertex AI. See what you can build with up to a 2M token context window, starting as low as 0.0001.';

          await response.data?.stream.forEach((event) {
            message += utf8.decode(event);
            Chat aiChat = Chat(
              message: message,
              type: Type.ai,
              collectionName: question.collectionName,
              sessionId: question.sessionId,
            );

            state.chat[0] = aiChat;

            emit(QahoLoading([...state.chat]));
          });

          emit(QahoSuccess(chat: [...state.chat]));

        } else {
          emit(QahoFailure(state.chat,
              error: response.data?.statusMessage ?? 'Unknown error'));
        }
      } catch (e) {
        emit(QahoFailure(state.chat, error: e.toString()));
      }
    }, transformer: sequential());
  }
}
