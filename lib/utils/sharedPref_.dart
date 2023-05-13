import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static PreferencesManager? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<PreferencesManager?> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
    if (_storageUtil == null) {
      var secureStorage = PreferencesManager._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  PreferencesManager._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// put integer
  static Future<bool>? setInt(String key, int value) {
    if (_preferences == null) return null;
    return _preferences?.setInt(key, value);
  }

  /// get integer
  static int getInt(String key, {int defValue = 0}) {
    if (_preferences == null) return defValue;
    return _preferences?.getInt(key) ?? defValue;
  }

  /// put String
  static Future<bool>? setString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences?.setString(key, value);
  }

  /// Get String
  static String getString(String key, {String defValue = ""}) {
    if (_preferences == null) return defValue;
    return _preferences?.getString(key) ?? defValue;
  }

  static Future<Future<bool>?> remove(String key) async {
    return _preferences?.remove(key);
  }

  static bool? getBool(String key, {bool? defValue}) {
    if (_preferences == null) return defValue;
    return _preferences?.getBool(key) ?? defValue;
  }

  static setBool(String key, bool value) async {
    _preferences?.setBool(key, value);
  }

  static clear() async {
    _preferences?.clear();
  }

  static Future<bool>? setStringListPref(String key, List<String> value) {
    if (_preferences == null) return null;
    return _preferences?.setStringList(key, value);
  }

  static List<String>? getStringListPref(
    String key,
  ) {
    if (_preferences == null) return null;
    return _preferences?.getStringList(key);
  }

  // static UserData? getUserDetails() {
  //   String body = getString(PreferencesKey.userModel);
  //   UserModel userModel = UserModel.fromJson(jsonDecode(body));
  //   return userModel.data;
  // }
}
