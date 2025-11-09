import 'package:flutter/foundation.dart' show kIsWeb;

class EndPOint {
  EndPOint._();

  // Change this if testing on real device
  static const String _emulatorHost = '10.0.2.2';
  static const String _webHost = 'localhost';
  static const String _realDeviceHost =
      '192.168.1.100'; // CHANGE THIS TO YOUR PC'S IP

  static const String _port = '8092';

  // Automatically choose the correct host
  static String get _host {
    if (kIsWeb) {
      return _webHost;
    } else {
      // For Android: use emulator IP or real device IP
      // You can make this smarter later (see advanced section)
      return _emulatorHost; // Default: emulator
      // return _realDeviceHost; // Uncomment when testing on real device
    }
  }

  static String get baseUrl => 'http://$_host:$_port/b-connect';

  // Endpoints
  static String get signUp => '$baseUrl/signup';
  static String get login => '$baseUrl/login';
  static String get forgetpassword => '$baseUrl/forgetpassword';
  static String get regdonor => '$baseUrl/reg_donor';
  static String get finddonor => '$baseUrl/findDonor';
  static String get saveProfilePhoto => '$baseUrl/saveProfilePhoto';
}
