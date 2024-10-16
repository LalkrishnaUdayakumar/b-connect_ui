import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? height;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? style;
  final Color? decorationColor;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.height,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.decoration,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.style,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            height: height,
            color: color,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            decorationColor: decorationColor,
          ),
    );
  }
}
