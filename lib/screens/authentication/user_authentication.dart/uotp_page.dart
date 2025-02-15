import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:veritransmobile/animation/fadeanimate.dart';
import 'package:veritransmobile/screens/authentication/user_authentication.dart/reset_password.dart';

import '../../../utils/general_widgets/components.dart';


class OTPPage extends StatelessWidget {
  final String email;
  final TextEditingController _otpController = TextEditingController();

  OTPPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter the OTP sent to $email',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            PinCodeTextField(
              appContext: context,
              length: 6, // OTP length
              controller: _otpController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                activeColor: Colors.blue,
                selectedColor: Colors.blue,
                inactiveColor: Colors.grey,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                // Called when the user types in the OTP
              },
              onCompleted: (value) {
                // Called when the user completes the OTP
                // You can automatically verify the OTP here if needed
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate OTP
                final otp = _otpController.text.trim();
                if (otp.isEmpty || otp.length != 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid OTP')),
                  );
                } else {
                  // Navigate to Reset Password page
                  nextScreen(context, FadeAnimate( ResetPasswordPage(email: '',)));
                }
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}