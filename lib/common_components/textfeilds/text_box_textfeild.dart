import 'package:flutter/material.dart';

import '../../constants.dart';

class TextBoxTextFeild extends StatelessWidget {
  const TextBoxTextFeild(
      {super.key,
      this.controller,
      required this.label,
      this.onChange,
      this.onClear,
      this.initialValue});

  final TextEditingController? controller;
  final String label;
  final Function(String)? onChange;
  final void Function()? onClear;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * textBoxHeight,
      width: screenSize.width * textBoxWidth,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.start,
        initialValue: initialValue,
        onChanged: onChange,
        controller: controller,
        decoration: InputDecoration(
          // hintStyle: const TextStyle(color: Color.fromARGB(255, 219, 90, 90)),
          labelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          // Customize the borders
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Specify your desired radius
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
          labelText: label,
        ),
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 92, 90, 90)),
      ),
    );
  }
}
