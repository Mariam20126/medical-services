/// id : 0
/// name : "Mahmoud"
/// email : "mahmoudd.gmail.com"
/// picture : null
/// phone : "01256846799"
/// gender : "male"
/// specialization : "Orthopedist"
/// price : 150.00
/// onlinePrice : null
/// nationalId : "12354698745632"
/// description : null
/// location : "Unknown"
/// averageRating : 0.0
/// availableAppointments : [{"id":8,"weeklyAppointments":"mon from 9:15 AM to 5:45 PM","status":"offline"}]
/// subscriptionStatus : true

class Doctor {
  Doctor(
      {this.id,
      this.name,
      this.email,
      this.picture,
      this.phone,
      this.gender,
      this.specialization,
      this.price,
      this.onlinePrice,
      this.nationalId,
      this.description,
      this.location,
      this.averageRating,
      this.availableAppointments,
      this.subscriptionStatus,
      this.statusCode,
      this.message});

  Doctor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    picture = json['picture'];
    phone = json['phone'];
    gender = json['gender'];
    specialization = json['specialization'];
    price = json['price'];
    onlinePrice = json['onlinePrice'];
    nationalId = json['nationalId'];
    description = json['description'];
    location = json['location'];
    averageRating = json['averageRating'];
    statusCode = json['statusCode'];
    message = json['message'];

    if (json['availableAppointments'] != null) {
      availableAppointments = [];
      json['availableAppointments'].forEach((v) {
        availableAppointments?.add(AvailableAppointments.fromJson(v));
      });
    }
    subscriptionStatus = json['subscriptionStatus'];
  }

  int? id;
  String? name;
  String? email;
  dynamic picture;
  String? phone;
  String? gender;
  String? specialization;
  double? price;
  dynamic onlinePrice;
  String? nationalId;
  dynamic description;
  String? location;
  double? averageRating;
  List<AvailableAppointments>? availableAppointments;
  bool? subscriptionStatus;
  String? statusCode;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['picture'] = picture;
    map['phone'] = phone;
    map['gender'] = gender;
    map['specialization'] = specialization;
    map['price'] = price;
    map['onlinePrice'] = onlinePrice;
    map['nationalId'] = nationalId;
    map['description'] = description;
    map['location'] = location;
    map['averageRating'] = averageRating;
    if (availableAppointments != null) {
      map['availableAppointments'] =
          availableAppointments?.map((v) => v.toJson()).toList();
    }
    map['subscriptionStatus'] = subscriptionStatus;
    return map;
  }
}

/// id : 8
/// weeklyAppointments : "mon from 9:15 AM to 5:45 PM"
/// status : "offline"

class AvailableAppointments {
  AvailableAppointments({
    this.id,
    this.weeklyAppointments,
    this.status,
  });

  AvailableAppointments.fromJson(dynamic json) {
    id = json['id'];
    weeklyAppointments = json['weeklyAppointments'];
    status = json['status'];
  }

  int? id;
  String? weeklyAppointments;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['weeklyAppointments'] = weeklyAppointments;
    map['status'] = status;
    return map;
  }
}
