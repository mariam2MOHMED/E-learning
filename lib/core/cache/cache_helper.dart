import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
@singleton
class SharedPreferencesHelper {
  static late SharedPreferences _preferences;


  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

   Future<void> setData({required String key, required dynamic value})async {
    if (value is String) {
      await   _preferences.setString(key, value);
    } else if (value is int) {
      await   _preferences.setInt(key, value);
    } else if (value is double) {
      await   _preferences.setDouble(key, value);
    } else if (value is bool) {
      await  _preferences.setBool(key, value);
    } else if (value is List<String>) {
      await   _preferences.setStringList(key, value);
    } else {
      throw UnsupportedError("Throw Message");
    }
  }
   String? getString({required String key}){
    _preferences.getString(key);
  }
   double? getDouble({required String key}){
    _preferences.getDouble(key);
  }
   int? getInt({required String key}){
    _preferences.getInt(key);
  }
   bool? getBool({required String key}){
    _preferences.getBool(key);
  }
  static Future<bool> delete({required String key}) async {
    return await _preferences.remove(key);
  }

  static Future<bool> clearAllData() async {
    return await _preferences.clear();
  }

  }



