import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

var textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.black12,));

//Phone Number TextField
Widget numberFormField(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.phone,
    maxLength: 10,
    style: const TextStyle(letterSpacing: 10),
    // textAlign: TextAlign.center,
    decoration: InputDecoration(
        hintText: '(024)xxxxxxx',
        // filled: true,
        counterText: '',
        // fillColor: Colors.white,
        border: textFieldBorder),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Phone number is required!';
      } else if (value.length < 10) {
        return 'Phone Number should exactly 10 digits';
      } else if (!value.startsWith('02') && !value.startsWith('05')) {
        return 'Invalid Number Format';
      }
      return null;
    },
  );
}

//PasswordFormField

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final FormFieldValidator<String>? validator;

  const PasswordFormField({
    Key? key,
    this.controller,
    this.label = 'Your Password',
    this.hintText = 'Enter Password',
    this.validator,
  }) : super(key: key);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      obscuringCharacter: '*',
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 8) {
              return 'Password must be at least 8 characters long';
            }
            if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])')
                .hasMatch(value)) {
              return 'Password must include an uppercase letter, a number, and a special character';
            }
            return null;
          },
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
    );
  }
}

// OTP Fields
// opt(BuildContext context, hasError, pin, onChange(value)) {
//   return PinCodeTextField(
//     appContext: context,
//     controller: pin,
//     keyboardType: TextInputType.number,
//     length: 6,
//     enableActiveFill: true,
//     pinTheme: PinTheme(
//         shape: PinCodeFieldShape.box,
//         borderRadius: BorderRadius.circular(5),
//         fieldHeight: 60,
//         fieldWidth: 50,
//         activeFillColor: hasError ? Colors.orange : Colors.white,
//         fieldOuterPadding: EdgeInsets.symmetric(horizontal: 2),
//         inactiveFillColor: Colors.white,
//         selectedFillColor: Colors.white),
//     onChanged: (value) {
//       onChange(value);
//     },
//   );
// }

Widget maintextFormField(
  TextEditingController controller,
) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.text,
    // style: const TextStyle(letterSpacing: 10),
    decoration: InputDecoration(
        hintText: 'Name',
        filled: true,
        fillColor: Colors.white,
        border: textFieldBorder),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Name is required!';
      } else if (value.length < 10) {
        return 'Name should not contain less than 10 characters';
      }
      return null;
    },
  );
}

// class TextInputField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final bool isObscure;
//   final IconData icon;
//   const TextInputField({
//     Key? key,
//     required this.controller,
//     required this.labelText,
//     this.isObscure = false,
//     required this.icon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         prefixIcon: Icon(icon),
//         labelStyle: const TextStyle(
//           fontSize: 20,
//         ),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//               color: borderColor,
//             )),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//               color: borderColor,
//             )),
//       ),
//       obscureText: isObscure,
//     );
//   }
// }