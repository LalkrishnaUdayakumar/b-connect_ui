import 'dart:convert';

class FindDonorRequest {
  final String bloodGroup;

  FindDonorRequest({
    required this.bloodGroup,
  });

  factory FindDonorRequest.fromRawJson(String str) =>
      FindDonorRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FindDonorRequest.fromJson(Map<String, dynamic> json) =>
      FindDonorRequest(
        bloodGroup: json["bloodGroup"],
      );

  Map<String, dynamic> toJson() => {
        "bloodGroup": bloodGroup,
      };
}
