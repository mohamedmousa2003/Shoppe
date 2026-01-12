import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

import '../network/logger_interceptor.dart';


@singleton
class ApiManager {
  late final Dio dio;

  final Logger _logger = Logger(
    level: kReleaseMode ? Level.nothing : Level.debug,
    printer: PrettyPrinter(
      methodCount: 1,
      printEmojis: true,
      colors: true,
    ),
  );

  ApiManager() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(LoggerInterceptor(_logger));
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
