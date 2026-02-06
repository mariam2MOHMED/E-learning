import 'package:elearning/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppLanguage extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  AppLanguage({required this.sharedPreferences});
  String selectedLocal = Constants.enLocalKey;

  bool isEnglish() => selectedLocal == Constants.enLocalKey;
  Future<void> setSelectedLocal()async{
    final currLocal=sharedPreferences.getString(Constants.localKey)??Constants.enLocalKey;
    selectedLocal=currLocal;
  }
  Future<void> changeLocal(String currentLocal) async {
    if (selectedLocal == currentLocal) {
      return;
    }
    selectedLocal = currentLocal;
    sharedPreferences.setString(Constants.localKey, selectedLocal);
    notifyListeners();
  }
}
