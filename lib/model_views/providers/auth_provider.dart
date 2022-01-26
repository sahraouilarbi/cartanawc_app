import 'package:cartanawc_app/data/models/customer_detail_model.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/api_service.dart';
import 'package:flutter/material.dart';

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
  Status loggedInStatus = Status.notLoggedIn;
  Status registeredInStatus = Status.notRegistered;

  //Status get loggedInStatus => _loggedInStatus;
  // set loggedInStatus(Status value) {
  //   _loggedInStatus = value;
  // }

  // Status get registeredInStatus => _registeredInStatus;
  // set registeredInStatus(Status value) {
  //   _registeredInStatus = value;
  // }

  final APIService _apiService = APIService();
  CustomerDetailModel _customerDetailModel;

  CustomerDetailModel get customerDetailModel => _customerDetailModel;

  Future<LoginResponseModel> login(String username, String password) async {
    loggedInStatus = Status.authenticating;
    notifyListeners();

    LoginResponseModel loginResponseModel;

    try {
      loginResponseModel = await _apiService.customerLogin(username, password);
      if (loginResponseModel.data.id != null) {
        loggedInStatus = Status.loggedIn;
        notifyListeners();
      } else {
        loggedInStatus = Status.notLoggedIn;
        notifyListeners();
      }
    } on Exception catch (e) {
      // TODO
      debugPrint("customer_provider line 47 : $e");
    }
    return loginResponseModel;
  }
}
