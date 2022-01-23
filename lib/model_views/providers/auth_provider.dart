import 'package:cartanawc_app/domain/entities/customer_detail_model.dart';
import 'package:cartanawc_app/domain/entities/login_model.dart';
import 'package:cartanawc_app/services/api_service.dart';
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
  Status _loggedInStatus = Status.notLoggedIn;
  Status _registeredInStatus = Status.notRegistered;

  Status get loggedInStatus => _loggedInStatus;
  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;
  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  final APIService _apiService = APIService();
  CustomerDetailModel _customerDetailModel;

  CustomerDetailModel get customerDetailModel => _customerDetailModel;

  Future<LoginResponseModel> login(String username, String password) async {
    _loggedInStatus = Status.authenticating;
    notifyListeners();

    LoginResponseModel loginResponseModel;

    try {
      loginResponseModel = await _apiService.customerLogin(username, password);
      if (loginResponseModel.data.id != null) {
        _loggedInStatus = Status.loggedIn;
        notifyListeners();
      } else {
        _loggedInStatus = Status.notLoggedIn;
        notifyListeners();
      }
    } on Exception catch (e) {
      // TODO
      print("customer_provider line 47 : $e");
    }
    return loginResponseModel;
  }
}
