import 'package:cartanawc_app/data/api/api_service.dart';
import 'package:cartanawc_app/data/models/login_model.dart';

abstract class RemoteDataSource {
  Future<LoginResponseModel> login(String username, String password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  APIService _apiService;
  @override
  Future<LoginResponseModel> login(String username, String password) async {
    return await _apiService.login(username, password);
  }
}
