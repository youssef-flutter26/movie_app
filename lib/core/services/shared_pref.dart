import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  // --- Boolean ---
  static Future<bool> setBool(String key, bool value) async {
    return await _instance.setBool(key, value);
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  // --- String ---
  static Future<bool> setString(String key, String value) async {
    return await _instance.setString(key, value);
  }

  static String getString(String key) {
    return _instance.getString(key) ?? '';
  }

  static String? getStringNullable(String key) {
    return _instance.getString(key);
  }

  // --- Int ---
  static Future<bool> setInt(String key, int value) async {
    return await _instance.setInt(key, value);
  }

  static int getInt(String key) {
    return _instance.getInt(key) ?? 0;
  }

  // --- Clear / Remove ---
  static Future<bool> remove(String key) async {
    return await _instance.remove(key);
  }

  static Future<bool> clear() async {
    return await _instance.clear();
  }
}
