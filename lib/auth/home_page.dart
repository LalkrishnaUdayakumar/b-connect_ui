import 'package:b_connect/auth/login_page.dart';
import 'package:b_connect/auth/signup_page.dart';
import 'package:b_connect/common_components/button.dart';
import 'package:b_connect/common_components/custom_text.dart';
import 'package:b_connect/mainscreen/donor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/reg_icon.png', // Example image URL
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const CustomText(
            text: 'Donate Blood',
            fontSize: 20,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 8,
          ),
          const CustomText(
            text: 'your donation can save many lives\n make a difference',
            fontSize: 18,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: Colors.black38,
          ),
          const SizedBox(
            height: 60,
          ),
          Button(
              onTap: () {
                context.go('/${SignupPage.id}');
                // context.go('/${DonorDetailsScreen.id}');
              },
              widget: const CustomText(
                text: 'SignUp',
                color: Colors.white,
                fontSize: 18,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(
            height: 20,
          ),
          Button(
              onTap: () {
                context.go('/${LoginPage.id}');
              },
              buttonColor: Colors.white,
              widget: const CustomText(
                text: 'Login',
                color: Color(0xFF800000),
                fontSize: 18,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
