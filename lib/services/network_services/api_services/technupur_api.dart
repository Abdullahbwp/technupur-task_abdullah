import 'dart:developer';
import '../../../core/Api Routs/api_path.dart';
import '../../../core/dio_implementation/dio.http.dart';

class TechnupurAPI {
  TechnupurAPI();
  final _http = HTTP.instance;

  /// Authentication
  Future<dynamic> category_info({var body}) async {
    print('object is -- ${body}');
    try {
      String url = '';
      url = ApiRoutes.category_info;
      log('url......$url', name: 'category_info | technupur');
      return await _http.iGet(url);
    } catch (e) {
      rethrow;
    }
  }
}
