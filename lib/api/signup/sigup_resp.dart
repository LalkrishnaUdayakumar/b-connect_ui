import 'dart:convert';

class SignUpResponse {
  final int responseId;
  final String responseMessage;
  String responseDescription;

  SignUpResponse({
    required this.responseId,
    required this.responseMessage,
    required this.responseDescription,
  });

  factory SignUpResponse.fromRawJson(String str) =>
      SignUpResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        responseId: json["responseId"],
        responseMessage: json["responseMessage"],
        responseDescription: json["responseDescription"],
      );

  Map<String, dynamic> toJson() => {
        "responseId": responseId,
        "responseMessage": responseMessage,
        "responseDescription": responseDescription,
      };
}
