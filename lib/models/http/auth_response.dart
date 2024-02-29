import 'dart:convert';

class AuthResponse {
    String token;
    DateTime expiration;
    User user;

    AuthResponse({
        required this.token,
        required this.expiration,
        required this.user,
    });

    factory AuthResponse.fromRawJson(String str) => AuthResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json["token"],
        expiration: DateTime.parse(json["expiration"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expiration": expiration.toIso8601String(),
        "user": user.toJson(),
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
