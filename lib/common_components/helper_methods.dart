import 'dart:convert';

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
