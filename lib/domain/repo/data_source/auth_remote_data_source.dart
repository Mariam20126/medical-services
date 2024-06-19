import 'package:medical/data/model/responce/RegisterResponse.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(String name, String email, String password,
      String phone, String gender, String geographicalArea);
}
