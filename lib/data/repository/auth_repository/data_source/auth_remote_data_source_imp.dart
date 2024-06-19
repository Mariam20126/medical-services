import 'package:medical/data/Api/apiManager.dart';
import 'package:medical/data/model/responce/RegisterResponse.dart';
import 'package:medical/domain/repo/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<RegisterResponse> register(String name, String email, String password,
      String phone, String gender, String geographicalArea) async {
    var response = await apiManager.Register(
        name, email, password, phone, gender, geographicalArea);
    return response;
  }
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
