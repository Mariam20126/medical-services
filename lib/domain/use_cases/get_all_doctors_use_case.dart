import 'package:medical/data/model/responce/Doctor.dart';
import 'package:medical/data/repository/auth_repository/repository/doctor_repository_imp.dart';
import 'package:medical/domain/repo/repository/doctor_repository_contract.dart';

class GetAllDoctorsUseCase {
  DoctorRepositoryContract repositoryContract;

  GetAllDoctorsUseCase({required this.repositoryContract});

  Future<Doctor> invoke() {
    return repositoryContract.getAllCategories();
  }
}

GetAllDoctorsUseCase injecGetCategoriesUseCase() {
  return GetAllDoctorsUseCase(
      repositoryContract: injectDashboardRepositoryContract());
}
