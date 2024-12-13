class UserModel {
  User user;
  Auth auth;

  UserModel({
    required this.user,
    required this.auth,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        auth: Auth.fromJson(json["auth"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "auth": auth.toJson(),
      };
}

class Auth {
  String token;

  Auth({
    required this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class User {
  num id;
  String firstName;
  String lastName;
  String phoneCode;
  String phone;
  String image;
  num points;
  String invitationCode;
  num cityId;
  City city;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneCode,
    required this.phone,
    required this.image,
    required this.points,
    required this.invitationCode,
    required this.cityId,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneCode: json["phone_code"],
        phone: json["phone"],
        image: json["image"],
        points: json["points"],
        invitationCode: json["invitation_code"],
        cityId: json["city_id"],
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone_code": phoneCode,
        "phone": phone,
        "image": image,
        "points": points,
        "invitation_code": invitationCode,
        "city_id": cityId,
        "city": city.toJson(),
      };
}

class City {
  num id;
  String title;
  num deliveryCost;
  num regionId;

  City({
    required this.id,
    required this.title,
    required this.deliveryCost,
    required this.regionId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        title: json["title"],
        deliveryCost: json["delivery_cost"],
        regionId: json["region_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "delivery_cost": deliveryCost,
        "region_id": regionId,
      };
}
