import 'package:flutter/material.dart';
import 'package:veritransmobile/animation/fadeanimate.dart';
import 'package:veritransmobile/screens/authentication/driver_authentication/dotp_page.dart';

import '../../../utils/general_widgets/components.dart';

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            const Center(
              child: Text(
                'Enter your email to receive an OTP',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Validate email and send OTP
            //     final email = _emailController.text.trim();
            //     if (email.isEmpty || !email.contains('@')) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text('Please enter a valid email')),
            //       );
            //     } else {
            //       // Navigate to OTP page
            //       nextScreen(context, FadeAnimate( OTPPage(email: '',)));
            //     }
            //   },
            //   child: const Text('Send OTP'),
            // ),
            PrimaryButton(text: "SEND OTP", onPressed: (){ nextScreen(context, FadeAnimate( DriverOTPPage(email: '',)));})
          ],
        ),
      ),
    );
  }
}