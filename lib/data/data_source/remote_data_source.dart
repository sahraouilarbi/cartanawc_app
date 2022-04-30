import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/customer_detail_model.dart';
import 'package:cartanawc_app/data/models/forgot_password_response_model.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/login_request.dart';

abstract class RemoteDataSource {
  Future<LoginResponseModel> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponseModel> forgotPassword(String email);
  Future<CustomerDetailModel> getCustomerProfile(int userId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this._apiService);
  final APIService _apiService;
  @override
  Future<LoginResponseModel> login(LoginRequest loginRequest) async {
    return _apiService.login(loginRequest.username, loginRequest.password);
  }

  @override
  Future<CustomerDetailModel> getCustomerProfile(int userId) {
    return _apiService.getCustomerDetails(userId);
  }

  @override
  Future<ForgotPasswordResponseModel> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }
}
