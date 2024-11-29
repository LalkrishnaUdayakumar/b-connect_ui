import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperMethods {
  makingPhoneCall(BuildContext context, String phoneNumber) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    var url = Uri.parse(phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      showCartSnackBar(
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
      showCartSnackBar(
          scaffoldMessenger, 'Sorry, we are not able to connect at the moment',
          status: false);
    }
  }

  void showCartSnackBar(
    ScaffoldMessengerState scaffoldMessenger,
    String message, {
    bool status = true,
  }) {
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: status ? Colors.green : Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
