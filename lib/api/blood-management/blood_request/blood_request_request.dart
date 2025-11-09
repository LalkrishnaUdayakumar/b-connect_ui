import 'dart:convert';

class BloodRequestRequest {
  final int donorId;
  final String bloodGroup;
  final String location;

  BloodRequestRequest({
    required this.donorId,
    required this.bloodGroup,
    required this.location,
  });

  factory BloodRequestRequest.fromRawJson(String str) =>
      BloodRequestRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BloodRequestRequest.fromJson(Map<String, dynamic> json) =>
      BloodRequestRequest(
        donorId: json["donorId"],
        bloodGroup: json["bloodGroup"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "donorId": donorId,
        "bloodGroup": bloodGroup,
        "location": location,
      };
}
