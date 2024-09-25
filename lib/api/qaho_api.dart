import 'package:http/http.dart';
import 'package:qaho/model/chat.dart';

class QahoApi {
  static const String baseUrl = 'https://api.qaho.io';
  Future<Response> call({required Question question}) async {
    return await post(
      Uri.parse('$baseUrl/chat'),
      body: question.toJson(),
    );
  }
}
