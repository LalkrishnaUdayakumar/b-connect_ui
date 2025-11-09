import 'dart:convert';

class LoginRequest {
  final String password;
  final String phoneNumber;

  LoginRequest({
    required this.password,
    required this.phoneNumber,
  });

  factory LoginRequest.fromRawJson(String str) =>
      LoginRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        password: json["password"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "phoneNumber": phoneNumber,
      };
}
