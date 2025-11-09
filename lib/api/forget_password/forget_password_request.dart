import 'dart:convert';

class ForgetPasswordRequest {
  final String phoneNumber;
  final String newPassword;

  ForgetPasswordRequest({
    required this.phoneNumber,
    required this.newPassword,
  });

  factory ForgetPasswordRequest.fromRawJson(String str) =>
      ForgetPasswordRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordRequest(
        phoneNumber: json["phoneNumber"],
        newPassword: json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "newPassword": newPassword,
      };
}
