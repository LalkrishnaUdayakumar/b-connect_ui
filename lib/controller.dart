import 'package:b_connect/api/login/login_api.dart';
import 'package:b_connect/api/login/login_req.dart';
import 'package:b_connect/api/login/login_resp.dart';
import 'package:b_connect/api/signup/signup_api.dart';
import 'package:b_connect/api/signup/signup_req.dart';
import 'package:b_connect/api/signup/sigup_resp.dart';
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
      password: userPassword.text,
    );
    return await signUpCall(signUpReq);
  }

  Future<LoginResponse?> login() async {
    LoginRequest loginReq = LoginRequest(
      phoneNumber: mobileNumber.text,
      password: userPassword.text,
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
