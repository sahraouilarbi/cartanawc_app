import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  // Save Username
  Future<void> setUsername(String username) async {
    _sharedPreferences.setString('PREFS_KEY_USERNAME', username);
  }

  // Get Username
  Future<String> getUsername() async {
    return _sharedPreferences.getString('PREFS_KEY_USERNAME') ?? '';
  }

  // Save Password
  Future<void> setPassword(String password) async {
    _sharedPreferences.setString('PREFS_KEY_USERNAME', password);
  }

  // Get Password
  Future<String> getPassword() async {
    return _sharedPreferences.getString('PREFS_KEY_USERNAME') ?? '';
  }

  // Save Token
  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString('PREFS_KEY_TOKEN', token);
  }

  // Get Token
  Future<String> getUserToken() async {
    return _sharedPreferences.getString('PREFS_KEY_TOKEN') ?? '';
  }

  // Set IsUserLoggedIn to true
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool('PREFS_KEY_IS_USER_LOGGED_IN', true);
  }

  // Get IsUserLoggedIn
  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool('PREFS_KEY_IS_USER_LOGGED_IN') ?? false;
  }

  // LOGOUT
  Future<void> logout() async {
    _sharedPreferences.remove('PREFS_KEY_IS_USER_LOGGED_IN');
  }

  // Set user id
  Future<void> setUserId(int userId) async {
    _sharedPreferences.setInt('PREFS_KEY_USER_ID', userId);
  }

  //Get user id
  Future<int> getUserId() async {
    return _sharedPreferences.getInt('PREFS_KEY_USER_ID');
  }
}
