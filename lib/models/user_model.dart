// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.avatar,
    this.userInfo,
    this.id,
  });

  String? name;
  String? surname;
  String? email;
  String? phone;
  String? avatar;
  String? userInfo;
  String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    surname: json["surname"],
    email: json["email"],
    phone: json["phone"],
    avatar: json["avatar"],
    userInfo: json["userInfo"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "surname": surname,
    "email": email,
    "phone": phone,
    "avatar": avatar,
    "userInfo": userInfo,
    "id": id,
  };
}
