import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medical/data/Api/apiConstant.dart';
import 'package:medical/data/model/request/LoginRequest.dart';
import 'package:medical/data/model/request/RegisterRequest.dart';
import 'package:medical/data/model/responce/Doctor.dart';
import 'package:medical/data/model/responce/LoginResonse.dart';
import 'package:medical/data/model/responce/RegisterResponseDto.dart';

class ApiManager {
  //todo singilton object by it i can use this object in the hole project and if i need one more i can use getInstance function
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<RegisterResponseDto> Register(
      String name,
      String email,
      String password,
      String phone,
      String gender,
      String geographicalArea) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.registerApi);

    var requestBody = RegisterRequest(
      name: name,
      email: email,
      password: password,
      phone: phone,
      gender: gender,
      geographicalArea: geographicalArea,
    );
    var response = await http.post(
      url,
      body: jsonEncode(requestBody.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return RegisterResponseDto.fromJson(json);
  }

  Future<LoginResponse> Login(String email, String password) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.LoginApi);

    var requestBody = LoginRequest(
      email: email,
      password: password,
    );
    var response = await http.post(
      url,
      body: jsonEncode(requestBody.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return LoginResponse.fromJson(json);
  }

  Future<Doctor> GetAllNurses() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.doctorApi);
    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return Doctor.fromJson(json);
  }

  Future<Doctor> GetAllDoctors() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.doctorApi);
    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return Doctor.fromJson(json);
  }
}
