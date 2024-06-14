import 'package:medical/data/model/responce/RegisterResponce.dart';

import 'package:medical/data/repository/auth_repository/data_source/auth_remote_data_source_imp.dart';
import 'package:medical/domain/repo/data_source/auth_remote_data_source.dart';
import 'package:medical/domain/repo/repository/auth_repository_contract.dart';

class AuthResitoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;

  AuthResitoryImpl({required this.remoteDataSource});

  @override
  Future<RegisterResponce> register(String name, String email, String password,
      String phone, String gender, String location) {
    return remoteDataSource.register(
        name, email, password, phone, gender, location);
  }
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthResitoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
