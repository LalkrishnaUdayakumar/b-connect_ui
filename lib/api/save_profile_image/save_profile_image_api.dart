import 'dart:convert';

import 'package:b_connect/api/end_points.dart';
import 'package:b_connect/api/save_profile_image/save_profile_image_req.dart';
import 'package:b_connect/api/save_profile_image/save_profile_image_resp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

typedef Request = SaveProfileImageRequest;
typedef Response = SaveProfileImageResponse;
String endPoint = EndPOint.login;
String apiName = '*** Login ***';

Future<Response?> loginCall(Request req) async {
  final url = Uri.parse(endPoint);

  debugPrint('Calling $apiName\nSending POST request to $url');
  debugPrint('Request body: ${req.toJson()}');

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: req.toRawJson(),
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
    }
  } on http.ClientException catch (e) {
    debugPrint('Unable to Connect to Server. Error: ${e.toString()}');
  } catch (e) {
    debugPrint('An unexpected error occurred: ${e.toString()}');
  }
  return null;
}