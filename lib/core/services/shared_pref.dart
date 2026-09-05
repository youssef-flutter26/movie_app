import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences __instance;
  static Future<void> init() async {
    __instance = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(String key, bool value) async {
    return await __instance.setBool(key, value);
  }

  static getBool(String key) {
    return __instance.getBool(key) ?? false;
  }
}
