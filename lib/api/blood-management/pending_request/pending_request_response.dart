import 'dart:convert';

class PendingRequestResponse {
  final int responseId;
  final String responseMessage;
  final String responseDescription;
  final List<Datum> data;

  PendingRequestResponse({
    required this.responseId,
    required this.responseMessage,
    required this.responseDescription,
    required this.data,
  });

  factory PendingRequestResponse.fromRawJson(String str) =>
      PendingRequestResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PendingRequestResponse.fromJson(Map<String, dynamic> json) =>
      PendingRequestResponse(
        responseId: json["responseId"],
        responseMessage: json["responseMessage"],
        responseDescription: json["responseDescription"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responseId": responseId,
        "responseMessage": responseMessage,
        "responseDescription": responseDescription,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int requestId;
  final int requesterId;
  final String requesterName;
  final String bloodGroup;
  final String location;
  final String status;
  final DateTime createdAt;

  Datum({
    required this.requestId,
    required this.requesterId,
    required this.requesterName,
    required this.bloodGroup,
    required this.location,
    required this.status,
    required this.createdAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        requestId: json["requestId"],
        requesterId: json["requesterId"],
        requesterName: json["requesterName"],
        bloodGroup: json["bloodGroup"],
        location: json["location"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "requesterId": requesterId,
        "requesterName": requesterName,
        "bloodGroup": bloodGroup,
        "location": location,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
      };
}
