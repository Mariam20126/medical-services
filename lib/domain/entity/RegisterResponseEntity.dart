import 'package:medical/data/model/responce/RegisterError.dart';

/// message : "User registered successfully"
/// user : {"id":1018,"name":"ali","email":"ali@gmail.com","password":"123456789","phone":"01205574123","gender":"male","geographicalArea":"Dokki"}

class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.error,
    this.user,
  });

  String? message;
  User? user;
  RegisterError? error;
}

/// id : 1018
/// name : "ali"
/// email : "ali@gmail.com"
/// password : "123456789"
/// phone : "01205574123"
/// gender : "male"
/// geographicalArea : "Dokki"

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

  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? gender;
  String? geographicalArea;
}
