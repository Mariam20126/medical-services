import 'package:medical/data/model/responce/Doctor.dart';

abstract class DoctorRemoteDataSource {
  Future<Doctor> getAllCategories();
}
