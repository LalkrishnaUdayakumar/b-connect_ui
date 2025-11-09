import 'dart:convert';

class SaveProfileImageResponse {
  final int? responseId;
  final String? responseMessage;
  final String? responseDescription;

  SaveProfileImageResponse({
    this.responseId,
    this.responseMessage,
    this.responseDescription,
  });

  factory SaveProfileImageResponse.fromRawJson(String str) =>
      SaveProfileImageResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SaveProfileImageResponse.fromJson(Map<String, dynamic> json) =>
      SaveProfileImageResponse(
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
