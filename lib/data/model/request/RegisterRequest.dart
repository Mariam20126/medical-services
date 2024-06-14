/// name : "ali"
/// email : "aymen"
/// password : "159753"
/// phone : "01205586296"
/// gender : "male"
/// geographicalArea : "shopra"

class RegisterRequest {
  RegisterRequest({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.gender,
    this.geographicalArea,
  });

  RegisterRequest.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    gender = json['gender'];
    geographicalArea = json['geographicalArea'];
  }

  String? name;
  String? email;
  String? password;
  String? phone;
  String? gender;
  String? geographicalArea;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['gender'] = gender;
    map['geographicalArea'] = geographicalArea;
    return map;
  }
}
