import 'dart:convert';

class SignUpRequest {
  final String userName;
  final String password;
  final String phoneNumber;

  SignUpRequest({
    required this.userName,
    required this.password,
    required this.phoneNumber,
  });

  factory SignUpRequest.fromRawJson(String str) =>
      SignUpRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        userName: json["userName"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "phoneNumber": phoneNumber,
      };
}
