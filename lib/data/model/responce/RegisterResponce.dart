import 'package:medical/data/model/responce/RegisterErrorResponce.dart';

/// message : "User registered successfully"
/// user : {"id":2015,"name":"IN","email":"IN@puple.com","password":"654123","phone":"01209987456","gender":"male","geographicalArea":"alex"}

class RegisterResponce {
  RegisterResponce({
    this.message,
    this.error,
    this.user,
  });

  RegisterResponce.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    error = json['error'] != null
        ? RegisterErrorResponce.fromJson(json['error'])
        : null;
  }

  String? message;
  User? user;
  RegisterErrorResponce? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

/// id : 2015
/// name : "IN"
/// email : "IN@puple.com"
/// password : "654123"
/// phone : "01209987456"
/// gender : "male"
/// geographicalArea : "alex"

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.gender,
    this.geographicalArea,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    gender = json['gender'];
    geographicalArea = json['geographicalArea'];
  }

  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? gender;
  String? geographicalArea;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['gender'] = gender;
    map['geographicalArea'] = geographicalArea;
    return map;
  }
}
