import 'dart:convert';

class LoginResponse {
  final String userName;
  final bool donor;
  final int responseId;
  final String responseMessage;
  final String responseDescription;
  final String token;

  LoginResponse({
    required this.userName,
    required this.donor,
    required this.responseId,
    required this.responseMessage,
    required this.responseDescription,
    required this.token,
  });

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userName: json["userName"],
        donor: json["donor"],
        responseId: json["responseId"],
        responseMessage: json["responseMessage"],
        responseDescription: json["responseDescription"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "donor": donor,
        "responseId": responseId,
        "responseMessage": responseMessage,
        "responseDescription": responseDescription,
        "token": token,
      };
}
