import 'dart:convert';

class LoginResponse {
  final int responseId;
  final String responseMessage;
  final String responseDescription;
  final Userdetails userdetails;
  final String token;

  LoginResponse({
    required this.responseId,
    required this.responseMessage,
    required this.responseDescription,
    required this.userdetails,
    required this.token,
  });

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        responseId: json["responseId"],
        responseMessage: json["responseMessage"],
        responseDescription: json["responseDescription"],
        userdetails: Userdetails.fromJson(json["userdetails"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "responseId": responseId,
        "responseMessage": responseMessage,
        "responseDescription": responseDescription,
        "userdetails": userdetails.toJson(),
        "token": token,
      };
}

class Userdetails {
  final String imageBytes;
  final String phoneNumber;
  final String userName;
  final String place;
  final String gender;
  final String numberOfTimesDonates;
  final String lastDateOfDonation;

  final bool donor;
  final String bloodGroup;

  Userdetails({
    required this.imageBytes,
    required this.phoneNumber,
    required this.userName,
    required this.place,
    required this.gender,
    required this.numberOfTimesDonates,
    required this.lastDateOfDonation,
    required this.donor,
    required this.bloodGroup,
  });

  factory Userdetails.fromRawJson(String str) =>
      Userdetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Userdetails.fromJson(Map<String, dynamic> json) => Userdetails(
        imageBytes: json["imageBytes"],
        phoneNumber: json["phoneNumber"],
        userName: json["userName"],
        place: json["place"],
        gender: json["gender"],
        numberOfTimesDonates: json["numberOfTimesDonates"],
        lastDateOfDonation: json["lastDateOfDonation"],
        donor: json["donor"],
        bloodGroup: json["bloodGroup"],
      );

  Map<String, dynamic> toJson() => {
        "imageBytes": imageBytes,
        "phoneNumber": phoneNumber,
        "userName": userName,
        "place": place,
        "gender": gender,
        "numberOfTimesDonates": numberOfTimesDonates,
        "lastDateOfDonation": lastDateOfDonation,
        "donor": donor,
        "bloodGroup": bloodGroup,
      };
}
