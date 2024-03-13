// https://app.quicktype.io/

import 'dart:convert';

class AuthResponse {
  String token;
  DateTime expiration;
  User user;
  Bran brand;
  Bran branch;

  AuthResponse({
    required this.token,
    required this.expiration,
    required this.user,
    required this.brand,
    required this.branch,
  });

  factory AuthResponse.fromRawJson(String str) =>
      AuthResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json["token"],
        expiration: DateTime.parse(json["expiration"]),
        user: User.fromJson(json["user"]),
        brand: Bran.fromJson(json["brand"]),
        branch: Bran.fromJson(json["branch"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expiration": expiration.toIso8601String(),
        "user": user.toJson(),
        "brand": brand.toJson(),
        "branch": branch.toJson(),
      };
}

class Bran {
  String id;
  String name;

  Bran({
    required this.id,
    required this.name,
  });

  factory Bran.fromRawJson(String str) => Bran.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bran.fromJson(Map<String, dynamic> json) => Bran(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class User {
  String userId;
  String userFirstName;
  String userLastName;
  String userEmail;

  User({
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userEmail,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        userFirstName: json["userFirstName"],
        userLastName: json["userLastName"],
        userEmail: json["userEmail"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userFirstName": userFirstName,
        "userLastName": userLastName,
        "userEmail": userEmail,
      };
}
