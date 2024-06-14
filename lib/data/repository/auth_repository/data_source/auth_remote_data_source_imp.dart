import 'package:medical/data/Api/apiManager.dart';
import 'package:medical/data/model/responce/RegisterResponce.dart';
import 'package:medical/domain/repo/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<RegisterResponce> register(String name, String email, String password,
      String phone, String gender, String location) async {
    var responce = await apiManager.Register(
        name, email, password, phone, gender, location);
    return responce;
  }
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
