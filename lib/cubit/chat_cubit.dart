import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaho/model/chat.dart';

class ChatCubit extends Cubit<List<Chat>> {
  ChatCubit() : super([]);

  void addChat(
      {required Type type,
      required String message,
      String? sessionId,
      String? collectionName}) {
    if (message.isEmpty && type == Type.human) return;
    final chat = Chat(
        type: type,
        message: message,
        sessionId: sessionId,
        collectionName: collectionName);
    emit([chat, ...state]);
  }

  void updateChat(
      {required Type type,
      required String message,
      String? sessionId,
      String? collectionName}) {
    if (message.isEmpty) return;
    final chat = Chat(
        type: type,
        message: message,
        sessionId: sessionId,
        collectionName: collectionName);
    state.removeAt(0);
    emit([chat, ...state]);
  }
}
