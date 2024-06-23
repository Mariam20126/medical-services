import 'package:medical/data/model/responce/LoginResonse.dart';
import 'package:medical/data/model/responce/RegisterResponseDto.dart';

import 'package:medical/data/repository/auth_repository/data_source/auth_remote_data_source_imp.dart';
import 'package:medical/domain/repo/data_source/auth_remote_data_source.dart';
import 'package:medical/domain/repo/repository/auth_repository_contract.dart';

class AuthResitoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;

  AuthResitoryImpl({required this.remoteDataSource});

  @override
  Future<RegisterResponseDto> register(String name, String email,
      String password, String phone, String gender, String geographicalArea) {
    return remoteDataSource.register(
        name, email, password, phone, gender, geographicalArea);
  }

  @override
  Future<LoginResponse> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthResitoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
