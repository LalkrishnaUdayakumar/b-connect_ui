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

class DonorDetailsScreen extends StatefulWidget {
  static const String id = 'donorDetailsScreen';
  const DonorDetailsScreen({super.key});

  @override
  State<DonorDetailsScreen> createState() => _DonorDetailsScreenState();
}

class _DonorDetailsScreenState extends State<DonorDetailsScreen> {
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
