import 'dart:convert';
import 'dart:io';

import 'package:b_connect/api/end_points.dart';
import 'package:b_connect/api/signup/signup_req.dart';
import 'package:b_connect/api/signup/sigup_resp.dart';
import 'package:b_connect/api/time_out_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

typedef Request = SignUpRequest;
typedef Response = SignUpResponse;
String endPoint = EndPOint.signUp;
String apiName = 'SignUp';

Future<Response?> signUpCall(Request req) async {
  final url = Uri.parse(endPoint);

  debugPrint('Calling $apiName\nSending POST request to $url');
  debugPrint('Request body: ${req.toJson()}');

  try {
    final response = await http
        .post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: req.toRawJson(),
    )
        .timeout(
      const Duration(seconds: 30), // Set a timeout of 30 seconds
      onTimeout: () {
        throw const TimeoutException('Connection timed out');
      },
    );

    final responseBody = jsonDecode(response.body);
    Response resp = Response.fromRawJson(response.body);

    debugPrint('Response status code: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 400) {
      String message = responseBody['responseMessage'];
      debugPrint('Response message: $message');
      return resp;
    } else {
      debugPrint('Failed to $apiName. Status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      return null;
    }
  } on TimeoutException {
    debugPrint('Connection timed out while trying to $apiName');
    // You might want to show a user-friendly error message
    return null;
  } on SocketException catch (e) {
    // Handle network-related errors
    if (e.osError?.errorCode == 7) {
      debugPrint('Server not found or no internet connection');
      // You might want to show a specific error message about no internet
    } else if (e.osError?.errorCode == 111) {
      debugPrint('Connection refused. Server might be down.');
      // You might want to show a specific error message about server being down
    } else {
      debugPrint('Network error occurred: ${e.toString()}');
    }
    return null;
  } on http.ClientException catch (e) {
    debugPrint('Client exception while trying to $apiName: ${e.toString()}');
    return null;
  } catch (e) {
    debugPrint('An unexpected error occurred: ${e.toString()}');
    return null;
  }
}
