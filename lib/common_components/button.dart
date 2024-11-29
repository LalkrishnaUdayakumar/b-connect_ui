import 'package:b_connect/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Color? buttonColor;
  final Widget? widget;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  const Button({
    super.key,
    this.buttonColor,
    this.widget,
    this.onTap,
    this.height,
    this.width,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        height: widget.height ?? screenSize.height * buttonBoxHeight,
        width: widget.width ?? screenSize.width * buttonBoxWidth,
        decoration: BoxDecoration(
            color: widget.buttonColor ?? const Color(0xFF800000),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF800000))),
        child: widget.widget,
      ),
    );
  }
}
