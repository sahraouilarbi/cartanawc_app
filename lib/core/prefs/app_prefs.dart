import 'package:shared_preferences/shared_preferences.dart';

abstract class AppPreferences {
  Future<void> setUsername(String username);
  Future<String> getUsername();
  Future<void> setPassword(String password);
  Future<String> getPassword();
  Future<void> setUserToken(String token);
  Future<String> getUserToken();
  Future<void> setIsUserLoggedIn();
  Future<bool> isUserLoggedIn();
  Future<void> logout();
  Future<void> setUserId(int userId);
  Future<int> getUserId();
}

class AppPreferencesImpl implements AppPreferences {
  AppPreferencesImpl(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  // Save Username
  @override
  Future<void> setUsername(String username) async {
    _sharedPreferences.setString('PREFS_KEY_USERNAME', username);
  }

  // Get Username
  @override
  Future<String> getUsername() async {
    return _sharedPreferences.getString('PREFS_KEY_USERNAME') ?? '';
  }

  // Save Password
  @override
  Future<void> setPassword(String password) async {
    _sharedPreferences.setString('PREFS_KEY_USERNAME', password);
  }

  // Get Password
  @override
  Future<String> getPassword() async {
    return _sharedPreferences.getString('PREFS_KEY_USERNAME') ?? '';
  }

  // Save Token
  @override
  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString('PREFS_KEY_TOKEN', token);
  }

  // Get Token
  @override
  Future<String> getUserToken() async {
    return _sharedPreferences.getString('PREFS_KEY_TOKEN') ?? '';
  }

  // Set IsUserLoggedIn to true
  @override
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool('PREFS_KEY_IS_USER_LOGGED_IN', true);
  }

  // Get IsUserLoggedIn
  @override
  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool('PREFS_KEY_IS_USER_LOGGED_IN') ?? false;
  }

  // LOGOUT
  @override
  Future<void> logout() async {
    _sharedPreferences.remove('PREFS_KEY_IS_USER_LOGGED_IN');
  }

  // Set user id
  @override
  Future<void> setUserId(int userId) async {
    _sharedPreferences.setInt('PREFS_KEY_USER_ID', userId);
  }

  //Get user id
  @override
  Future<int> getUserId() async {
    return _sharedPreferences.getInt('PREFS_KEY_USER_ID');
  }
}
