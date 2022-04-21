import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flut_all_content/app/app_prefs.dart';
import 'package:flut_all_content/app/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "Aapplication/json";
const String CONTENT_TYPE = "content_type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio _dio = Dio();
    const int _timeOut = 60 * 1000; // 1 min
    String language = await _appPreferences.getAppLanguage();
    Map<String, dynamic> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constant.token,
      DEFAULT_LANGUAGE: language
    };

    _dio.options = BaseOptions(
        baseUrl: Constant.baseUrl,
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        headers: headers);

    if (kReleaseMode) {
      log("release mode no logs");
    } else {
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true));
    }
    return _dio;
  }
}
