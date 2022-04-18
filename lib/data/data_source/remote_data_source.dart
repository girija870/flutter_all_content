import 'package:dio/dio.dart';
import 'package:flut_all_content/data/network/app_api.dart';
import 'package:flut_all_content/data/request/request.dart';
import 'package:flut_all_content/data/response/response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<Response> resetPassword(String email);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.email,
        loginRequest.password, loginRequest.imei, loginRequest.deviceType);
  }

  @override
  Future<Response> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
