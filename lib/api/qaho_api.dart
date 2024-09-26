
import 'package:http/http.dart';
import 'package:qaho/model/chat.dart';

import '../const/key.dart';

class QahoApi {
  Future<Response> connect() async {
    return await get(
      Uri.parse(Key.qahoUrl),
    );
  }

  Future<Response> call({required Question question}) async {
    return await post(
      Uri.parse('${Key.qahoUrl}/qaho'),
      body: question.toRawJson(),
    );
  }
}
