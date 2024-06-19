import 'package:medical/data/model/responce/RegisterResponse.dart';
import 'package:medical/data/repository/auth_repository/repository/auth_repository_implementation.dart';
import 'package:medical/domain/repo/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  Future<RegisterResponse> invoke(String name, String email, String password,
      String phone, String gender, String geographicalArea) {
    return repositoryContract.register(
        name, email, password, phone, gender, geographicalArea);
  }
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}
