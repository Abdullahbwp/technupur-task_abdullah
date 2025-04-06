import 'dart:developer';
import '../../api_services/technupur_api.dart';

class Repository {
  Repository._privateConstructor();

  static final Repository _instance = Repository._privateConstructor();

  static Repository get instance => _instance;

  final TechnupurAPI _technupurAPI = TechnupurAPI();

  Future<dynamic> category_info({var body}) async {
    try {
      log('body......$body', name: 'category_info | TechnupurAPI');

      var data = await _technupurAPI.category_info(body: body);

      log('data......$data', name: 'category_info | AuthRepository');

      return data;
    } catch (e) {
      log('catch error......${e.toString()}', name: 'category_info | AuthRepository');
      rethrow;
    }
  }
}
