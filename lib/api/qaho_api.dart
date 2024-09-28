
import 'package:dio/dio.dart';

import 'package:qaho/model/chat.dart';

import '../const/key.dart';

class QahoApi {
  Future<Response> connect() async {
    return await Dio().get(
      SKey.qahoUrl,
    );
  }

  Future<Response<ResponseBody>> call({required Question question}) async {
    return await Dio().post<ResponseBody>(
      '${SKey.qahoUrl}/qaho',
      data: question.toRawJson(),
      options: Options(
          responseType: ResponseType.stream,
          contentType: Headers.jsonContentType),
    );
  }
}
