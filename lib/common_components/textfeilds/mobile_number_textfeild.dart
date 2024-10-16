import 'package:b_connect/constants.dart';
import 'package:b_connect/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileNumberTextFeild extends StatefulWidget {
  final TextEditingController? controller;
  const MobileNumberTextFeild({
    super.key,
    this.controller,
  });

  @override
  State<MobileNumberTextFeild> createState() => _MobileNumberTextFeildState();
}

Color mobileBorderColor = Colors.grey.shade300;

class _MobileNumberTextFeildState extends State<MobileNumberTextFeild> {
  Color mobileBorderColor = Colors.grey.shade300;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.090,
      width: screenSize.width * textBoxWidth,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.start,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
        ],
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 92, 90, 90),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
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
          labelText: "Mobile Number",
          counterText: ' ',
        ),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 92, 90, 90),
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.done,
        validator: validateMobile,
        onChanged: (value) {
          setState(() {
            validateMobile(value) == null
                ? mobileBorderColor = const Color(0xFFE91e63)
                : mobileBorderColor = Colors.grey.shade300;
          });
        },
      ),
    );
  }
}

String? validateMobile(String? value) {
  const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final regex = RegExp(pattern);

  return value!.isEmpty || !regex.hasMatch(value)
      ? '*Enter a valid mobile number'
      : null;
}
