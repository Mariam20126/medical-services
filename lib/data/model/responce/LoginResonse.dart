//import 'package:medical/data/model/responce/LoginError.dart';

import 'LoginError.dart';

class LoginResponse {
  LoginResponse({
    this.message,
    this.error,
    this.user,
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    error = json['error'] != null ? LoginError.fromJson(json['error']) : null;
  }

  String? message;
  User? user;
  LoginError? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

/// email : "ali@gmail.com"
/// password : "123456789"

class User {
  User({
    this.email,
    this.password,
  });

  User.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }

  String? email;
  String? password;

  get name => null;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['email'] = email;
    map['password'] = password;

    return map;
  }
}
