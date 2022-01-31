import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString('PREFS_KEY_TOKEN', token);
  }

  Future<String> getUserToken() async {
    _sharedPreferences.getString('PREFS_KEY_TOKEN') ?? '';
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool('PREFS_KEY_IS_USER_LOGGED_IN', true);
  }

  Future<void> isUserLoggedIn() async {
    _sharedPreferences.getBool('PREFS_KEY_IS_USER_LOGGED_IN') ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove('PREFS_KEY_IS_USER_LOGGED_IN');
  }
}
