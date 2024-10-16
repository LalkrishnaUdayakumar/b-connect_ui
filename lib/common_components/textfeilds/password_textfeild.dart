import 'package:b_connect/constants.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  const PasswordTextField({super.key, this.controller, required this.label});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  Color passwordBorderColor = Colors.grey.shade300;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.090,
      width: screenSize.width * textBoxWidth,
      child: TextFormField(
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.start,
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: true,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 219, 90, 90)), // Updated hint color
          labelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Added border radius
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 4, 1, 1)), // Color when not focused
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
                color: Color(0xFF800000)), // Color when focused
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
                color: Color(0xFF800000)), // Color when enabled
          ),
          counterText: ' ',
          labelText: widget.label,
        ),
        style: const TextStyle(
          fontSize: 18, // Updated font size
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 92, 90, 90), // Updated text color
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        validator: validatePassword,
        onChanged: (value) {
          setState(() {
            validatePassword(value) == null
                ? passwordBorderColor = const Color(0xFFE91e63)
                : passwordBorderColor = Colors.grey.shade300;
          });
        },
      ),
    );
  }

  String? validatePassword(String? value) {
    // Regular expression to enforce password rules
    final pattern = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}\[\]:;<>,.?~\-]).{8,}$',
    );

    return value!.isEmpty
        ? '*This field cannot be blank'
        : !pattern.hasMatch(value)
            ? '*Password must contain at least one uppercase letter\n one lowercase letter, one digit, and one special character\nPassword must be at least 8 characters long.'
            : null;
  }
}
