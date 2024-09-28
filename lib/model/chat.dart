// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Question {
  final String question;
  final String sessionId;
  final String collectionName;

  Question({
    required this.question,
    required this.sessionId,
    required this.collectionName,
  });

  factory Question.fromRawJson(String str) =>
      Question.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        sessionId: json["session_id"],
        collectionName: json["collection_name"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "session_id": sessionId,
        "collection_name": collectionName,
      };
}

enum Type { human, ai }

class Chat {
  final Type type;
  final String message;
  final String? sessionId;
  final String? collectionName;

  Chat({
    required this.type,
    required this.message,
    this.sessionId,
    this.collectionName,
  });

  factory Chat.fromJson(String str) => Chat.fromJson(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Chat.fromMap(Map<String, dynamic> json) => Chat(
        type: json["type"] == "human" ? Type.human : Type.ai,
        message: json["message"],
        sessionId: json["session_id"],
        collectionName: json["collection_name"],
      );

  Map<String, dynamic> toMap() => {
        "type": type == Type.human ? "human" : "ai",
        "message": message,
        "session_id": sessionId,
        "collection_name": collectionName,
      };

  Chat copyWith({
    Type? type,
    String? message,
    String? sessionId,
    String? collectionName,
  }) {
    return Chat(
      type: type ?? this.type,
      message: message ?? this.message,
      sessionId: sessionId ?? this.sessionId,
      collectionName: collectionName ?? this.collectionName,
    );
  }
}
