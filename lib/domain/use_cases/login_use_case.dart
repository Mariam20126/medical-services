import 'package:medical/data/repository/auth_repository/repository/auth_repository_implementation.dart';
import 'package:medical/domain/repo/repository/auth_repository_contract.dart';

import '../../data/model/responce/LoginResonse.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

  Future<LoginResponse> invoke(String email, String password) {
    return repositoryContract.login(email, password);
  }
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepositoryContract());
}
