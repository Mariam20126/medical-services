import 'package:medical/data/model/responce/RegisterResponce.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponce> register(String name, String email, String password,
      String phone, String gender, String location);
}
