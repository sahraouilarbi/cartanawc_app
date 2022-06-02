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
  static const String prefsKeyUsername = 'PREFS_KEY_USERNAME';
  static const String prefsKeyPassword = 'PREFS_KEY_PASSWORD';
  static const String prefsKeyToken = 'PREFS_KEY_TOKEN';
  static const String prefsKeyIsUserLoggedIn = 'PREFS_KEY_IS_USER_LOGGED_IN';
  static const String prefsKeyUserID = 'PREFS_KEY_USER_ID';

  // Save Username
  @override
  Future<void> setUsername(String username) async {
    _sharedPreferences.setString(prefsKeyUsername, username);
  }

  // Get Username
  @override
  Future<String> getUsername() async {
    return _sharedPreferences.getString(prefsKeyUsername) ?? '';
  }

  // Save Password
  @override
  Future<void> setPassword(String password) async {
    _sharedPreferences.setString(prefsKeyPassword, password);
  }

  // Get Password
  @override
  Future<String> getPassword() async {
    return _sharedPreferences.getString(prefsKeyPassword) ?? '';
  }

  // Save Token
  @override
  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(prefsKeyToken, token);
  }

  // Get Token
  @override
  Future<String> getUserToken() async {
    return _sharedPreferences.getString(prefsKeyToken) ?? '';
  }

  // Set IsUserLoggedIn to true
  @override
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  // Get IsUserLoggedIn
  @override
  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  // LOGOUT
  @override
  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

  // Set user id
  @override
  Future<void> setUserId(int userId) async {
    _sharedPreferences.setInt(prefsKeyUserID, userId);
  }

  //Get user id
  @override
  Future<int> getUserId() async {
    return _sharedPreferences.getInt(prefsKeyUserID);
  }
}
