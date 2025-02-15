import 'package:flutter/material.dart';

//main button
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity, // Default width
    this.height = 60, // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

//navigation functions
//move to next screen
void nextScreen(BuildContext ctx, Route route) {
  Navigator.of(ctx).push(route);
}

//move to prev screen
void nextScreenClosePrev(BuildContext ctx, Route route) {
  Navigator.of(ctx).pushReplacement(route);
}

void closeUI(BuildContext context) {
  Navigator.pop(context);
}

void nextscreenRemovePredicate(BuildContext context, Route route) {
  Navigator.pushAndRemoveUntil(
    context,
    route,
    (Route<dynamic> route) => false,
  );
}

/// Reusable Text Field
class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}

/// Reusable Card Widget
class InfoCard extends StatelessWidget {
  final String title;
  final String description;

  const InfoCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}


