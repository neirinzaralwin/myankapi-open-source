import 'package:myankapi/configs/shared_preferences_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  //Keys
  static const String _token = "token";
  static const String _refreshToken = "refreshToken";
  static SharedPreferences instance = SharedPreferencesSingleton.instance!;
  static Future<bool> setToken(String token) async =>
      await instance.setString(_token, token);
  static String get getToken => instance.getString(_token) ?? "";

  static Future<bool> setRefreshToken(String token) async =>
      await instance.setString(_refreshToken, token);
  static String get getRefreshToken => instance.getString(_refreshToken) ?? "";

  // user
  static const String _userId = "userId";
  static Future<bool> setUserId(int userId) async =>
      await instance.setInt(_userId, userId);
  static int get getUserId => instance.getInt(_userId) ?? 0;
}
