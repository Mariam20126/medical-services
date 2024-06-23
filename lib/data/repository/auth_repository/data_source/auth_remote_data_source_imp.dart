import 'package:medical/data/Api/apiManager.dart';
import 'package:medical/data/model/responce/LoginResonse.dart';
import 'package:medical/data/model/responce/RegisterResponseDto.dart';
import 'package:medical/domain/repo/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<RegisterResponseDto> register(
      String name,
      String email,
      String password,
      String phone,
      String gender,
      String geographicalArea) async {
    var response = await apiManager.Register(
        name, email, password, phone, gender, geographicalArea);
    return response;
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    var response = await apiManager.Login(email, password);
    return response;
  }
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
