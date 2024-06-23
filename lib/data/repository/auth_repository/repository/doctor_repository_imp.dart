/*
AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthResitoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}

 */

import 'package:medical/data/model/responce/Doctor.dart';
import 'package:medical/data/repository/auth_repository/data_source/auth_remote_data_source_imp.dart';
import 'package:medical/data/repository/auth_repository/data_source/doctor_remote_data_source_imp.dart';
import 'package:medical/domain/repo/data_source/doctor_remote_data_source.dart';
import 'package:medical/domain/repo/repository/doctor_repository_contract.dart';

class DoctorRepositoryImp implements DoctorRepositoryContract {
  DoctorRemoteDataSource remoteDataSource;

  DoctorRepositoryImp({required this.remoteDataSource});

  @override
  Future<Doctor> getAllCategories() {
    return remoteDataSource.getAllCategories();
  }
}

DoctorRepositoryContract injectDashboardRepositoryContract() {
  return DoctorRepositoryImp(
      remoteDataSource: injectDashboardRemoteDataSource());
}
