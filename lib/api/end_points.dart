import 'dart:io' show Platform;

class EndPOint {
  EndPOint._();
  static String get host => Platform.isAndroid ? '10.0.2.2' : 'localhost';
  static const String port = '8092';
  static String get baseUrl => 'http://$host:$port/b-connect';

  // user
  static String get signUp => '$baseUrl/signup';
  static String get login => '$baseUrl/login';
  static String get forgetpassword => '$baseUrl/forgetpassword';
  static String get regDonor => '$baseUrl/reg_donor';
}
