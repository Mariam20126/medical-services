import 'package:medical/data/model/responce/RegisterResponce.dart';
import 'package:medical/data/repository/auth_repository/repository/auth_repository_implementation.dart';
import 'package:medical/domain/repo/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  Future<RegisterResponce> invoke(String name, String email, String password,
      String phone, String gender, String location) {
    return repositoryContract.register(
        name, email, password, phone, gender, location);
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}
