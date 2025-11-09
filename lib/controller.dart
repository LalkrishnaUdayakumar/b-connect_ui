import 'package:b_connect/api/user-management/login/login_api.dart';
import 'package:b_connect/api/user-management/login/login_req.dart';
import 'package:b_connect/api/user-management/login/login_resp.dart';
import 'package:b_connect/api/user-management/signup/signup_api.dart';
import 'package:b_connect/api/user-management/signup/signup_req.dart';
import 'package:b_connect/api/user-management/signup/sigup_resp.dart';
import 'package:b_connect/common_components/helper_methods.dart';
import 'package:flutter/material.dart';

class AuthController {
  AuthController._privateConstructor();
  static final AuthController instance = AuthController._privateConstructor();

  TextEditingController mobileNumber = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userConfirmPassword = TextEditingController();

  Future<SignUpResponse?> signUp() async {
    SignUpRequest signUpReq = SignUpRequest(
      userName: userName.text,
      phoneNumber: mobileNumber.text,
      password: hashPassword(userPassword.text),
    );
    return await signUpCall(signUpReq);
  }

  Future<LoginResponse?> login() async {
    LoginRequest loginReq = LoginRequest(
      phoneNumber: mobileNumber.text,
      password: hashPassword(userPassword.text),
    );
    return await loginCall(loginReq);
  }

// not working check this
  void clear() {
    mobileNumber.clear();
    userName.clear();
    userPassword.clear();
    userConfirmPassword.clear();
  }
}
