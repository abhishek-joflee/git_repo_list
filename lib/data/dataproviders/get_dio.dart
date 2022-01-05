import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/my_hive_constants.dart';

Dio getDio() {
  var options = BaseOptions(
    baseUrl: jakeGitBaseURL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  Dio dio = Dio(options);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        log("Requesting API: ${options.uri}", name: "API");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log("ResponseCode: ${response.statusCode}", name: "API");
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        log("Error in API call", error: e.error.toString(), name: "API");
        if (e.response?.statusCode == 403) {
          Fluttertoast.showToast(msg: "Limit exceeded. Try later");
          handler.reject(e);
        }
        if (e.response!.statusCode! >= 400) {
          Fluttertoast.showToast(msg: "Something went wrong");
          handler.reject(e);
        }
      },
    ),
  );

  return dio;
}
