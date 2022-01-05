import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/my_hive_constants.dart';
import 'get_dio.dart';

class RepoAPI {
  final Dio _dio = getDio();

  /// it fetches the json of repositories from api and return it
  Future<dynamic> getRawRepos(int pageCount) async {
    try {
      var r = await _dio.get(
        "",
        queryParameters: {page: pageCount, perPage: 15},
      );

      if (r.statusCode == 403) {
        Fluttertoast.showToast(msg: "Limit exceeded. Try later");
        return null;
      }
      if (r.statusCode! >= 400) {
        Fluttertoast.showToast(msg: "Something went wrong");
        return null;
      }

      return r.data;
    } catch (e, stackTrace) {
      log("", error: e, stackTrace: stackTrace);
    }
  }
}
