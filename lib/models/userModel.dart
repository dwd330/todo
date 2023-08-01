import 'dart:convert';

List<User> adminModelFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String adminModelToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.email,
    required this.password,
  });

  String id;
  String email;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
      };
}
