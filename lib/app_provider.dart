import 'package:b_connect/api/finddonors/finddonor_response.dart';
import 'package:b_connect/api/user-management/login/login_resp.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String? _bearerToken;
  List<UserInfo> _userInfo = [];
  LoginResponse? _loginResponse;
  String? get bearerToken => _bearerToken;
  List<UserInfo> get getUserInfo => _userInfo;
  LoginResponse? get getLoginResponse => _loginResponse;

  void setBearerToken(String bearerToken) {
    _bearerToken = bearerToken;
    notifyListeners();
  }

  void setUserInfo(List<UserInfo> value) {
    _userInfo = value;
    notifyListeners();
  }

  void setLoginResponse(LoginResponse loginResponse) {
    _loginResponse = loginResponse;
    notifyListeners();
  }
}
