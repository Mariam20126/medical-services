import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medical/data/Api/apiConstant.dart';
import 'package:medical/data/model/request/RegisterRequest.dart';
import 'package:medical/data/model/responce/RegisterResponce.dart';

class ApiManager {
  //todo singilton object by it i can use this object in the hole project and if i need one more i can use getInstance function
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<RegisterResponce> Register(String name, String email, String password,
      String phone, String gender, String location) async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.registerApi);

    var requestBody = RegisterRequest(
        name: name,
        email: email,
        gender: gender,
        geographicalArea: location,
        password: password,
        phone: phone);
    var responce = await http.post(url, body: requestBody.toJson());
    var responceBody = responce.body;
    var json = jsonDecode(responceBody);
    return RegisterResponce.fromJson(json);
  }
}
