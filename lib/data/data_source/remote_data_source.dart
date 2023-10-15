import 'package:flut_all_content/data/network/app_api.dart';
import 'package:flut_all_content/data/request/request.dart';
import 'package:flut_all_content/data/response/response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<ForgotPasswordResponse> forgotPassword(String email);

  Future<AuthenticationResponse> register(RegisterRequest registerRequest);

  Future<HomeDetailsResponse> fetchHomeDetails();

  Future<SingleStoreDetailsResponse> fetchSingleStoreDetails();
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
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<AuthenticationResponse> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.userName,
        registerRequest.countryMobileCode,
        registerRequest.email,
        registerRequest.password,
        registerRequest.mobileNumber,
        registerRequest.profilePicture);
  }

  @override
  Future<HomeDetailsResponse> fetchHomeDetails() async {
    return await _appServiceClient.fetchHomeDetails();
  }

  @override
  Future<SingleStoreDetailsResponse> fetchSingleStoreDetails() async {
    return await _appServiceClient.fetchSingleStoreDetails();
  }
}
