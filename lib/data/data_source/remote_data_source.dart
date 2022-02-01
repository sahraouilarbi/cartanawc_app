import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/login_model.dart';
import 'package:cartanawc_app/data/models/login_request.dart';

abstract class RemoteDataSource {
  Future<LoginResponseModel> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this._apiService);
  final APIService _apiService;
  @override
  Future<LoginResponseModel> login(LoginRequest loginRequest) async {
    return await _apiService.login(
        loginRequest.username, loginRequest.password);
  }
}
