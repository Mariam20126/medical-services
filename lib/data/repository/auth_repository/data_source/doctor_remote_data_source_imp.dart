import 'package:medical/data/Api/apiManager.dart';
import 'package:medical/data/model/responce/Doctor.dart';
import 'package:medical/domain/repo/data_source/doctor_remote_data_source.dart';

class DoctorDataSourceImp implements DoctorRemoteDataSource {
  ApiManager apiManager;

  DoctorDataSourceImp({required this.apiManager});

  @override
  Future<Doctor> getAllCategories() async {
    var response = await apiManager.GetAllNurses();
    return response;
  }
}

DoctorRemoteDataSource injectDashboardRemoteDataSource() {
  return DoctorDataSourceImp(apiManager: ApiManager.getInstance());
}
