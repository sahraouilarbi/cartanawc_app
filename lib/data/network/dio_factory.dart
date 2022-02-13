import 'package:cartanawc_app/core/prefs/app_prefs.dart';
import 'package:cartanawc_app/data/api/api_endpoint.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory(this._appPreferences);
  final AppPreferences _appPreferences;
  Future<Dio> getDio() async {
    final Dio dio = Dio();
    const int _timeOut = 60 * 1000;
    final String token = await _appPreferences.getUserToken() != ''
        ? await _appPreferences.getUserToken()
        : APIConsumer().basicAuth;
    final Map<String, String> headers = {
      "content-type": "application/json",
      "accept": "application/json",
      "authorization": token,
    };
    dio.options = BaseOptions(
      baseUrl: APIEndPoint().baseUrl,
      connectTimeout: _timeOut,
      receiveTimeout: _timeOut,
      headers: headers,
    );
    if (kReleaseMode) {
      print('release mode no logs');
    } else {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
