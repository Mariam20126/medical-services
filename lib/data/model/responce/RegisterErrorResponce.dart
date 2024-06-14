/// $id : "1"
/// message : "User with this email already exists"

class RegisterErrorResponce {
  RegisterErrorResponce({
    this.id,
    this.message,
  });

  RegisterErrorResponce.fromJson(dynamic json) {
    id = json['$id'];
    message = json['message'];
  }

  String? id;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$id'] = id;
    map['message'] = message;
    return map;
  }
}
