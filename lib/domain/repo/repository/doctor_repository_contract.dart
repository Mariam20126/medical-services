import 'package:medical/data/model/responce/Doctor.dart';

abstract class DoctorRepositoryContract {
  Future<Doctor> getAllCategories();
}
