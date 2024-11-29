import 'package:flutter/material.dart';

class BloodtypeWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const BloodtypeWidget(
      {super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFffffff),
              borderRadius: BorderRadius.circular(05),
              border: Border.all(
                color: const Color.fromARGB(255, 215, 211, 211), // Border color
                width: 01, // Border width
              ),
            ),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
