import 'package:medical/data/model/responce/LoginResonse.dart';
import 'package:medical/data/model/responce/RegisterResponseDto.dart';

abstract class AuthRepositoryContract {
  Future<RegisterResponseDto> register(String name, String email,
      String password, String phone, String gender, String geographicalArea);

  Future<LoginResponse> login(String email, String password);
}
