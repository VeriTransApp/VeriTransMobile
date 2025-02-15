import 'package:flutter/material.dart';
import 'package:veritransmobile/animation/fadeanimate.dart';
import 'package:veritransmobile/screens/authentication/user_authentication.dart/ulogin_page.dart';
import 'package:veritransmobile/utils/general_widgets/components.dart';

class ResetPasswordPage extends StatelessWidget {
  final String email;
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  ResetPasswordPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Reset your password for $email',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _newPasswordController,
              decoration: const InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate passwords
                final newPassword = _newPasswordController.text.trim();
                final confirmPassword = _confirmPasswordController.text.trim();

                if (newPassword.isEmpty || confirmPassword.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                } else if (newPassword != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Passwords do not match')),
                  );
                } else {
                  // Reset password logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password reset successful')),
                  );
                  nextScreen(context, FadeAnimate(const UserLogin())); // Go back to login, make sure to change the routing to remove all other screens
                }
              },
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}