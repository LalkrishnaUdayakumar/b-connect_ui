import 'dart:math';

import 'package:b_connect/api/signup/sigup_resp.dart';
import 'package:b_connect/auth/home_page.dart';
import 'package:b_connect/auth/login_page.dart';
import 'package:b_connect/common_components/button.dart';
import 'package:b_connect/common_components/curved_bottom_clipper.dart';
import 'package:b_connect/common_components/custom_text.dart';
import 'package:b_connect/common_components/textfeilds/mobile_number_textfeild.dart';
import 'package:b_connect/common_components/textfeilds/password_textfeild.dart';
import 'package:b_connect/common_components/textfeilds/text_box_textfeild.dart';
import 'package:b_connect/controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignupPage extends StatefulWidget {
  static const String id = 'signup';
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthController ctrl = AuthController.instance;

  @override
  void initState() {
    super.initState();
    ctrl.userPassword.addListener(() => setState(() {}));
    ctrl.userConfirmPassword.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  height: 180, // Adjust this height based on your needs
                  color:
                      const Color(0xFF800000), // Your desired background color
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 25),
                child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Colors.white, size: 30),
                    onPressed: () {
                      context.go('/${HomePage.id}');
                    }),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 80.0, left: 20),
                child: CustomText(
                  text: 'Sign Up',
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const CustomText(
            text: 'Create your Account',
            fontSize: 20,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomText(
            text: 'Register now to create a new account',
            fontSize: 18,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: Colors.black38,
          ),
          const SizedBox(
            height: 15,
          ),
          TextBoxTextFeild(
            label: 'Name',
            controller: ctrl.userName,
          ),
          const SizedBox(
            height: 15,
          ),
          MobileNumberTextFeild(
            controller: ctrl.mobileNumber,
          ),
          PasswordTextField(
            label: 'Password',
            controller: ctrl.userPassword,
          ),
          const SizedBox(
            height: 15,
          ),
          PasswordTextField(
            label: 'Confirm Password',
            controller: ctrl.userConfirmPassword,
          ),
          ctrl.userPassword.text != ctrl.userConfirmPassword.text
              ? const CustomText(
                  text: '*The password and confirmation password must match',
                  color: Color.fromARGB(255, 219, 90, 90),
                  fontSize: 10,
                  height: 0,
                  textAlign: TextAlign.left,
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 15,
          ),
          Button(
              onTap: () async {
                if (ctrl.userPassword.text.isNotEmpty &&
                    ctrl.userConfirmPassword.text.isNotEmpty &&
                    ctrl.userPassword.text == ctrl.userConfirmPassword.text) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: const Color(0xFF800000),
                          size: 50,
                        ),
                      );
                    },
                  );

                  try {
                    final stopwatch = Stopwatch()..start();
                    SignUpResponse? response = await ctrl.signUp();

                    final elapsedTime = stopwatch.elapsedMilliseconds;
                    final remainingTime = max(0, 1200 - elapsedTime);

                    // Wait for remaining time if needed
                    if (remainingTime > 0) {
                      await Future.delayed(
                          Duration(milliseconds: remainingTime));
                    }
                    Navigator.of(context).pop();
                    if (response?.responseId == 200) {
                      debugPrint(response?.responseDescription);
                      context.go('/${LoginPage.id}');
                      // ctrl.clear;
                    }
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                } else {
                  debugPrint(
                    'Invalid Password\nPassword must contain at least one uppercase letter\none lowercase letter, one digit, and one special character\nPassword must be at least 8 characters long',
                  );
                }
              },
              widget: const CustomText(
                text: 'SignUp',
                color: Colors.white,
                fontSize: 18,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(
            height: 25,
          ),
          Button(
              buttonColor: Colors.white10,
              onTap: () {},
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                    child: Image.network(
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                        fit: BoxFit.cover),
                  ),
                  const CustomText(
                    text: 'Signin with google',
                    color: Color(0xFF800000),
                    fontSize: 18,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Already have an account? ',
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
              InkWell(
                onTap: () {
                  context.go('/${LoginPage.id}');
                },
                child: const CustomText(
                  text: 'Login',
                  color: Color(0xFF800000),
                  fontSize: 18,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
