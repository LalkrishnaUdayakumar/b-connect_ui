import 'dart:math';

import 'package:b_connect/api/login/login_resp.dart';
import 'package:b_connect/app_provider.dart';
import 'package:b_connect/auth/forgot_password.dart';
import 'package:b_connect/auth/home_page.dart';
import 'package:b_connect/auth/signup_page.dart';
import 'package:b_connect/common_components/button.dart';
import 'package:b_connect/common_components/curved_bottom_clipper.dart';
import 'package:b_connect/common_components/custom_text.dart';
import 'package:b_connect/common_components/helper_methods.dart';
import 'package:b_connect/common_components/textfeilds/mobile_number_textfeild.dart';
import 'package:b_connect/common_components/textfeilds/password_textfeild.dart';
import 'package:b_connect/controller.dart';
import 'package:b_connect/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    final AuthController ctrl = AuthController.instance;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

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
                  text: 'Login',
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const CustomText(
            text: 'Welcome Back!',
            fontSize: 20,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomText(
            text: "Let's login for explore continues",
            fontSize: 18,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: Colors.black38,
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
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: InkWell(
              onTap: () {
                context.go('/${ForgotPassword.id}');
              },
              child: const CustomText(
                text: 'Forget Password?',
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 0.5,
                decoration: TextDecoration.underline,
                decorationColor: Color(0xFF800000),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Button(
              onTap: () async {
                // Check if mobile number and password are not empty
                ctrl.mobileNumber.text = '9074827514';
                ctrl.userPassword.text = 'Lal@123!';
                if (ctrl.mobileNumber.text.isNotEmpty &&
                    ctrl.userPassword.text.isNotEmpty) {
                  // Show loading dialog
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                        color: const Color(0xFF800000),
                        size: 50,
                      ),
                    ),
                  );

                  try {
                    // Start timer
                    final stopwatch = Stopwatch()..start();

                    // Perform login
                    LoginResponse? response = await ctrl.login();

                    // Calculate remaining time to ensure at least 2 seconds of loading
                    final elapsedTime = stopwatch.elapsedMilliseconds;
                    final remainingTime = max(0, 1200 - elapsedTime);

                    // Wait for remaining time if needed
                    if (remainingTime > 0) {
                      await Future.delayed(
                          Duration(milliseconds: remainingTime));
                    }

                    // Close loading dialog
                    navigator.pop();

                    // Check response
                    if (response != null && response.responseId == 200) {
                      debugPrint(response.responseDescription);
                      appProvider.setBearerToken(response.token);
                      appProvider.setLoginResponse(response);

                      // Navigate to main screen
                      context.go('/${MainScreen.id}');
                    } else {
                      showSnackBar(
                          scaffoldMessenger, 'Login failed. Please try again',
                          status: false);
                    }
                  } catch (e) {
                    // Close loading dialog
                    navigator.pop();

                    debugPrint(e.toString());

                    showSnackBar(scaffoldMessenger,
                        'An error occurred during login: ${e.toString()}',
                        status: false);
                  }
                } else {
                  showSnackBar(scaffoldMessenger,
                      'Please enter mobile number and password',
                      status: false);
                }
              },
              widget: const CustomText(
                text: 'Login',
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
                  context.go('/${SignupPage.id}');
                },
                child: const CustomText(
                  text: 'SignUp',
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
