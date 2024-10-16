import 'package:b_connect/api/login/login_resp.dart';
import 'package:b_connect/auth/forgot_password.dart';
import 'package:b_connect/auth/home_page.dart';
import 'package:b_connect/auth/signup_page.dart';
import 'package:b_connect/common_components/button.dart';
import 'package:b_connect/common_components/curved_bottom_clipper.dart';
import 'package:b_connect/common_components/custom_text.dart';
import 'package:b_connect/common_components/textfeilds/mobile_number_textfeild.dart';
import 'package:b_connect/common_components/textfeilds/password_textfeild.dart';
import 'package:b_connect/controller.dart';
import 'package:b_connect/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final AuthController ctrl = AuthController.instance;
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
                {
                  if (ctrl.mobileNumber.text.isNotEmpty &&
                      ctrl.userPassword.text.isNotEmpty) {
                    try {
                      LoginResponse? response = await ctrl.login();
                      if (response?.responseId == 200) {
                        debugPrint(response?.responseDescription);
                        context.go('/${MainScreen.id}', extra: response);
                        // ctrl.clear;
                      }
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  } else {
                    debugPrint(
                      'User not found, Please enter a valid user details',
                    );
                  }
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