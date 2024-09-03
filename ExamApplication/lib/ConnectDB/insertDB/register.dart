// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  String name;
  String email;
  String phone;
  String password;
  String sex;
  Register({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.sex
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    sex: json["sex"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "sex": sex,
  };
}
