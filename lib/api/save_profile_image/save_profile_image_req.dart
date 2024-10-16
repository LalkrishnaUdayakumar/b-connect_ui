import 'dart:convert';

class SaveProfileImageRequest {
  final String imageBytes;

  SaveProfileImageRequest({
    required this.imageBytes,
  });

  factory SaveProfileImageRequest.fromRawJson(String str) =>
      SaveProfileImageRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SaveProfileImageRequest.fromJson(Map<String, dynamic> json) =>
      SaveProfileImageRequest(
        imageBytes: json["imageBytes"],
      );

  Map<String, dynamic> toJson() => {
        "imageBytes": imageBytes,
      };
}
