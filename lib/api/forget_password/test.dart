import 'package:b_connect/api/change_password/change_password_api.dart';
import 'package:b_connect/api/change_password/change_password_request.dart';
import 'package:b_connect/token.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ForgetPasswordApp());
}

class ForgetPasswordApp extends StatelessWidget {
  const ForgetPasswordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ForgetPasswordTestPage(),
    );
  }
}

class ForgetPasswordTestPage extends StatefulWidget {
  const ForgetPasswordTestPage({super.key});

  @override
  State<ForgetPasswordTestPage> createState() => _ForgetPasswordTestPageState();
}

class _ForgetPasswordTestPageState extends State<ForgetPasswordTestPage> {
  String _responseMessage = 'Press the button to test API';

  Future<void> _callForgetPassword() async {
    await TokenStorage.saveToken(
        "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI5MDc0ODI3NTE0IiwiaWF0IjoxNzYyNjI5NTYyLCJleHAiOjE3NjI2MzU1NjJ9.PAr4V09NDQP8wg2YPX6BMxEpKVvhP6ZGeUmt78g8UBq2V-y9KBvjJiW8dffQqF873pkeRwaGsRQEhVr0jVz4jw");

    final request = ChangePasswordRequest(
      oldPassword: 'newPassword123',
      newPassword: 'Lal@123!',
    );

    try {
      final response = await changePassword(request);
      setState(() {
        _responseMessage = 'Response: ${response?.toJson()}';
      });
      print('✅ Forget Password API Success: ${response?.toJson()}');
    } catch (e) {
      setState(() {
        _responseMessage = 'Error: $e';
      });
      print('❌ Forget Password API Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forget Password Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _callForgetPassword,
              child: const Text('Test Forget Password API'),
            ),
            const SizedBox(height: 20),
            Text(
              _responseMessage,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
