import 'dart:convert';

class RequestHistoryResponse {
  final int responseId;
  final String responseMessage;
  final String responseDescription;
  final List<Datum> data;

  RequestHistoryResponse({
    required this.responseId,
    required this.responseMessage,
    required this.responseDescription,
    required this.data,
  });

  factory RequestHistoryResponse.fromRawJson(String str) =>
      RequestHistoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequestHistoryResponse.fromJson(Map<String, dynamic> json) =>
      RequestHistoryResponse(
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
  final int id;
  final int requesterId;
  final int donorId;
  final String bloodGroup;
  final String location;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Datum({
    required this.id,
    required this.requesterId,
    required this.donorId,
    required this.bloodGroup,
    required this.location,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        requesterId: json["requesterId"],
        donorId: json["donorId"],
        bloodGroup: json["bloodGroup"],
        location: json["location"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "requesterId": requesterId,
        "donorId": donorId,
        "bloodGroup": bloodGroup,
        "location": location,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
