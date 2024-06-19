import 'package:medical/data/model/responce/RegisterResponse.dart';

abstract class AuthRepositoryContract {
  Future<RegisterResponse> register(String name, String email, String password,
      String phone, String gender, String geographicalArea);
}
