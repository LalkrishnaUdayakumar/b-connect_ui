import 'package:b_connect/api/blood-management/approve_request/approve_request_api.dart';
import 'package:b_connect/api/blood-management/pending_request/pending_request_api.dart';
import 'package:b_connect/api/blood-management/reject_request/reject_request_api.dart';
import 'package:b_connect/api/blood-management/request_history/request_history_api.dart';
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
        "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI5ODQ3MTIzNDU2IiwiaWF0IjoxNzYyNjczOTM3LCJleHAiOjE3NjI2Nzk5Mzd9.8hX2DjawLGNAUvH-QHmPJj2gftoc7wx903vIkwxBg6EIxhGCForZLwcjXjyOnVSQibVl8HnojkRx_VYA4xuadw");
    // final request = ForgetPasswordRequest(
    //   phoneNumber: '9876543210',
    //   newPassword: 'newPassword123',
    // );

    try {
      final response = await getRequestHistory('PENDING');
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
