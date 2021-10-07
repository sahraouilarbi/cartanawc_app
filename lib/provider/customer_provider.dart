import 'package:cartanawc_app/models/login_model.dart';
import 'package:cartanawc_app/services/api_service.dart';
import 'package:cartanawc_app/models/customer_detail_model.dart';
import 'package:flutter/material.dart';

//https://medium.com/@afegbua/flutter-thursday-13-building-a-user-registration-and-login-process-with-provider-and-external-api-1bb87811fd1d

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
  final Status _registeredInStatus = Status.notRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

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

// class CustomerProvider with ChangeNotifier {
//   CustomerDetailModel _customerDetailModel = CustomerDetailModel();
//
//   CustomerDetailModel get customerDetailModel => _customerDetailModel;
//
//   void setCustomerDetailModel(CustomerDetailModel customerDetailModel) {
//     _customerDetailModel = customerDetailModel;
//     notifyListeners();
//   }
// }
