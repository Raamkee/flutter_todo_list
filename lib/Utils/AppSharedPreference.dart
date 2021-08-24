import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // setUserLoggedIn(bool isLoggedIn) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.setBool(UserLog.IS_USER_LOGGED_IN, isLoggedIn);
  // }

  // static Future<bool> isUserLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(UserLog.IS_USER_LOGGED_IN);
  // }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    print(value);
    prefs.setString(key, value);
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }
}
