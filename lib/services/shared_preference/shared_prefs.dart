import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final String _saveUserDataKey = 'Save user';
  final String _tokenKey = 'Save token';
  final String _user_id_Key = 'user id';
  final String location_check_key = 'location_check_key';
  final String _as_login_Key = 'login as a business or driver';
  final String _workout_level = 'workout_level';
  Future getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String val = prefs.getString(_saveUserDataKey) ?? '';
    if (val.isEmpty) {
      return val;
    }
    return json.decode(val);
  }

  Future<void> saveUser(dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_saveUserDataKey, json.encode(value));
  }
  Future getaslogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_as_login_Key);
  }

  Future<void> saveaslogin(dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_as_login_Key, value);
  }

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> saveToken(dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_tokenKey, value);
  }

  Future get_workout_level() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_workout_level);
  }

  Future<void> save_workout_level(dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_workout_level, value);
  }

  Future getid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_user_id_Key);
  }

  Future<void> saveid(dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_user_id_Key, value.toString());
  }

  Future get_location_check() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(location_check_key);
  }

  Future<void> save_location_check_key(dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(location_check_key, value);
  }
  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
