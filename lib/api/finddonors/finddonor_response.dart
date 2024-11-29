import 'dart:convert';

class FindDonorResponse {
  final int? responseId;
  final String? responseMessage;
  final String? responseDescription;
  final List<UserInfo> userInfo;

  FindDonorResponse({
    required this.responseId,
    required this.responseMessage,
    required this.responseDescription,
    required this.userInfo,
  });

  factory FindDonorResponse.fromRawJson(String str) =>
      FindDonorResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FindDonorResponse.fromJson(Map<String, dynamic> json) =>
      FindDonorResponse(
        responseId: json["responseId"],
        responseMessage: json["responseMessage"],
        responseDescription: json["responseDescription"],
        userInfo: List<UserInfo>.from(
            json["userInfo"].map((x) => UserInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responseId": responseId,
        "responseMessage": responseMessage,
        "responseDescription": responseDescription,
        "userInfo": List<dynamic>.from(userInfo.map((x) => x.toJson())),
      };
}

class UserInfo {
  final int? id;
  final String? imageBytes;
  final String? phoneNumber;
  final String? userName;
  final String? place;
  final String? gender;
  final String? numberOfTimesDonates;
  final String? lastDateOfDonation;
  final String? bloodGroup;

  UserInfo({
    required this.id,
    required this.imageBytes,
    required this.phoneNumber,
    required this.userName,
    required this.place,
    required this.gender,
    required this.numberOfTimesDonates,
    required this.lastDateOfDonation,
    required this.bloodGroup,
  });

  factory UserInfo.fromRawJson(String str) =>
      UserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        imageBytes: json["imageBytes"],
        phoneNumber: json["phoneNumber"],
        userName: json["userName"],
        place: json["place"],
        gender: json["gender"],
        numberOfTimesDonates: json["numberOfTimesDonates"],
        lastDateOfDonation: json["lastDateOfDonation"],
        bloodGroup: json["bloodGroup"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageBytes": imageBytes,
        "phoneNumber": phoneNumber,
        "userName": userName,
        "place": place,
        "gender": gender,
        "numberOfTimesDonates": numberOfTimesDonates,
        "lastDateOfDonation": lastDateOfDonation,
        "bloodGroup": bloodGroup,
      };
}
