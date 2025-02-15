import 'package:flutter/material.dart';
import 'package:veritransmobile/animation/fadeanimate.dart';
import 'package:veritransmobile/screens/authentication/user_authentication.dart/uotp_page.dart';

import '../../../utils/general_widgets/components.dart';

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter your email to receive an OTP',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate email and send OTP
                final email = _emailController.text.trim();
                if (email.isEmpty || !email.contains('@')) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid email')),
                  );
                } else {
                  // Navigate to OTP page
                  nextScreen(context, FadeAnimate( OTPPage(email: '',)));
                }
              },
              child: Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}