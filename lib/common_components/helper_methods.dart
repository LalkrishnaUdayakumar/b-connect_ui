import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:crypto/crypto.dart';

makingPhoneCall(BuildContext context, String phoneNumber) async {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  var url = Uri.parse(phoneNumber);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    showSnackBar(
        scaffoldMessenger, 'Sorry, we are not able to connect at the moment',
        status: false);
  }
}

launchWhatsapp(BuildContext context, String phoneNumber) async {
  final url = 'https://wa.me/$phoneNumber';
  final Uri whatsappUrl = Uri.parse(url);
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  // Try launching the URL
  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl);
  } else {
    showSnackBar(
        scaffoldMessenger, 'Sorry, we are not able to connect at the moment',
        status: false);
  }
}

void showSnackBar(
  ScaffoldMessengerState scaffoldMessenger,
  String message, {
  bool status = true,
}) {
  scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: status ? Colors.green : const Color(0xFF800000),
      duration: const Duration(seconds: 2),
    ),
  );
}

String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var hash = sha256.convert(bytes);
  return hash.toString();
}

Future<String> encodeImageToBase64(File imagePath) async {
  // Read the image as bytes
  List<int> imageBytes = await imagePath.readAsBytes();
  // Encode to Base64
  String base64String = base64Encode(imageBytes);
  return base64String;
}

Uint8List decodeBase64ToImage(String base64String) {
  return base64Decode(base64String);
}
