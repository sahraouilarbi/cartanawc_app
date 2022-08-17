import 'package:flutter/material.dart';

import '/core/dependency_injection.dart';
import '/core/prefs/app_prefs.dart';
import '/data/api/api_service.dart';
import '/data/models/models.dart';

enum Status {
  notLoggedIn,
  notRegistered,
  loggedIn,
  registered,
  authenticating,
  registering,
  loggedOut
}

class AuthProvider with ChangeNotifier {
  final APIService _apiService = instance<APIService>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  late CustomerDetailModel _customerDetailModel;
  CustomerDetailModel get customerDetailModel => _customerDetailModel;

  Status loggedInStatus = Status.notLoggedIn;
  Status registeredInStatus = Status.notRegistered;

  Future<void> isUserLoggedIn() async {
    loggedInStatus = await _appPreferences.isUserLoggedIn()
        ? Status.loggedIn
        : Status.notLoggedIn;
    notifyListeners();
  }

  Future<LoginResponseModel> login(String username, String password) async {
    loggedInStatus = Status.authenticating;
    notifyListeners();

    late LoginResponseModel loginResponseModel;

    try {
      loginResponseModel = await _apiService.login(username, password);
      if (loginResponseModel.data!.id != null) {
        loggedInStatus = Status.loggedIn;
        notifyListeners();
      } else {
        loggedInStatus = Status.notLoggedIn;
        notifyListeners();
      }
    } on Exception catch (e) {
      // TODO
      debugPrint("auth_provider line 47 : $e");
    }
    return loginResponseModel;
  }
}
