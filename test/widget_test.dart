import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> createUser(
    String userName, String password, String phoneNumber) async {
  const String url = 'http://localhost:8082/b-connect/createuser';

  // Create the request body
  final Map<String, dynamic> body = {
    'userName': userName,
    'password': password,
    'phoneNumber': phoneNumber,
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Parse the response
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      debugPrint('Response ID: ${responseData['responseId']}');
      debugPrint('Response Message: ${responseData['responseMessage']}');
      debugPrint(
          'Response Description: ${responseData['responseDescription']}');
    } else {
      debugPrint('Failed to create user. Status code: ${response.statusCode}');
      debugPrint('Response: ${response.body}');
    }
  } catch (e) {
    debugPrint('Error creating user: $e');
  }
}

// Usage example
