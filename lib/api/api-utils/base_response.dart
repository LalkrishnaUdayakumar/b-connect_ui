import 'dart:convert';

class BaseResponse {
  final int responseId;
  final String responseMessage;
  final String responseDescription;

  BaseResponse({
    required this.responseId,
    required this.responseMessage,
    required this.responseDescription,
  });

  factory BaseResponse.fromRawJson(String str) =>
      BaseResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
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
