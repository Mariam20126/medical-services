/// message : "User with this email already exists"

class RegisterError {
  RegisterError({
    this.message,
  });

  RegisterError.fromJson(dynamic json) {
    message = json['message'];
  }

  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}