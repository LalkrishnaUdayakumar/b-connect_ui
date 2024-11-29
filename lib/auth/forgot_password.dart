import 'package:b_connect/auth/home_page.dart';
import 'package:b_connect/auth/login_page.dart';
import 'package:b_connect/common_components/button.dart';
import 'package:b_connect/common_components/curved_bottom_clipper.dart';
import 'package:b_connect/common_components/custom_text.dart';
import 'package:b_connect/common_components/textfeilds/mobile_number_textfeild.dart';
import 'package:b_connect/common_components/textfeilds/password_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = 'forgot_password';
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                      context.go('/${LoginPage.id}');
                    }),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 80.0, left: 20),
                child: CustomText(
                  text: 'Forget Password',
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const CustomText(
            text:
                "Please enter your registred mobile number, We'll send you a link to reset your password.",
            fontSize: 18,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: Colors.black38,
          ),
          const SizedBox(
            height: 15,
          ),
          const MobileNumberTextFeild(),
          const SizedBox(
            height: 15,
          ),
          const PasswordTextField(
            label: 'Password',
          ),
          const SizedBox(
            height: 15,
          ),
          const PasswordTextField(
            label: 'Confirm Password',
          ),
          const SizedBox(
            height: 15,
          ),
          Button(
              onTap: () {
                context.go('/${HomePage.id}');
              },
              widget: const CustomText(
                text: 'Reset Password',
                color: Colors.white,
                fontSize: 18,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(
            height: 25,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
