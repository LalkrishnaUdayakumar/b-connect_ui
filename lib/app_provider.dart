import 'package:b_connect/api/finddonors/finddonor_response.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String? _bearerToken;
  List<UserInfo> _userInfo = [];
  String? get bearerToken => _bearerToken;
  List<UserInfo> get getUserInfo => _userInfo;

  void setBearerToken(String bearerToken) {
    _bearerToken = bearerToken;
    notifyListeners();
  }

  void setUserInfo(List<UserInfo> value) {
    _userInfo = value;
    notifyListeners();
  }
}
