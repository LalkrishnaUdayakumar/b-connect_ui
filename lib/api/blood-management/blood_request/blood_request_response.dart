import 'dart:convert';

class BloodRequestResponse {
  final int responseId;
  final String responseMessage;
  final String responseDescription;
  final dynamic data;

  BloodRequestResponse({
    required this.responseId,
    required this.responseMessage,
    required this.responseDescription,
    required this.data,
  });

  factory BloodRequestResponse.fromRawJson(String str) =>
      BloodRequestResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BloodRequestResponse.fromJson(Map<String, dynamic> json) =>
      BloodRequestResponse(
        responseId: json["responseId"],
        responseMessage: json["responseMessage"],
        responseDescription: json["responseDescription"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "responseId": responseId,
        "responseMessage": responseMessage,
        "responseDescription": responseDescription,
        "data": data,
      };
}
