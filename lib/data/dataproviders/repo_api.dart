import 'package:dio/dio.dart';

import '../../utils/my_hive_constants.dart';
import 'get_dio.dart';

class RepoAPI {
  final Dio _dio = getDio();

  /// it fetches the json of repositories from api and return it
  Future<List<dynamic>> getRawRepos(int pageCount) async {
    var r = await _dio.get(
      "",
      queryParameters: {page: pageCount, perPage: 15},
    );

    return r.data;
  }
}
