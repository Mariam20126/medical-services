import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medical/data/Api/apiConstant.dart';
import 'package:medical/data/model/request/RegisterRequest.dart';
import 'package:medical/data/model/responce/RegisterResponse.dart';

class ApiManager {
  //todo singilton object by it i can use this object in the hole project and if i need one more i can use getInstance function
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<RegisterResponse> Register(String name, String email, String password,
      String phone, String gender, String geographicalArea) async {
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
    return RegisterResponse.fromJson(json);
  }
}
