import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:veritransmobile/animation/bottomup.dart';
import 'package:veritransmobile/screens/authentication/driver_authentication/reset_password.dart';

import '../../../utils/general_widgets/components.dart';


class DriverOTPPage extends StatelessWidget {
  final String email;
  final TextEditingController _otpController = TextEditingController();

  DriverOTPPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            Center(
              child: Text(
                'Enter the OTP sent to $email',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Validate OTP
            //     final otp = _otpController.text.trim();
            //     if (otp.isEmpty || otp.length != 6) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text('Please enter a valid OTP')),
            //       );
            //     } else {
            //       // Navigate to Reset Password page
            //       nextScreen(context, FadeAnimate( ResetPasswordPage(email: '',)));
            //     }
            //   },
            //   child: Text('Verify OTP'),
            // ),
            PrimaryButton(text: 'VERIFY OTP', onPressed: (){nextScreen(context, BottomUpAnimate( ResetPasswordPage(email: '',)));})
          ],
        ),
      ),
    );
  }
}