import 'package:dio/dio.dart';

class ApiManager {
  late final Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? param,
    Map<String, dynamic>? headers,
  }) async {
    return dio.get(
      endPoint,
      queryParameters: param,
      options: Options(headers: headers),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    return dio.post(
      endPoint,
      data: body,
      options: Options(headers: headers),
    );
  }
}
