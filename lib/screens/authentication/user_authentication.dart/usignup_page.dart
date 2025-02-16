import 'package:flutter/material.dart';
import 'package:veritransmobile/animation/bottomup.dart';
import 'package:veritransmobile/animation/fadeanimate.dart';
import 'package:veritransmobile/animation/slideanimate.dart';
import 'package:veritransmobile/controllers/form_fields_controller.dart';
import 'package:veritransmobile/screens/authentication/driver_authentication/forgot_password.dart';
import 'package:veritransmobile/screens/authentication/user_authentication.dart/ulogin_page.dart';
import 'package:veritransmobile/screens/authentication/user_authentication.dart/uotp_page.dart';
import 'package:veritransmobile/screens/authentication/user_authentication.dart/usignup_page.dart';
import 'package:veritransmobile/screens/home_display/dashboard.dart';
import 'package:veritransmobile/utils/general_widgets/main_screen.dart';

import '../../../utils/general_widgets/components.dart';
import '../../extras/app_colors.dart';
import '../../extras/custom_scaffold.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({super.key});

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50,),
                      const Text('Sign Up'),
                      const Text(
                        'New User?',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      // const SizedBox(height: 20.0),
                      // const Padding(
                      //   padding: EdgeInsets.only(right: 270),
                      //   child: Text('Your Email',style: TextStyle(fontStyle: FontStyle.italic),),
                      // ),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter Email';
                      //     }
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     label: const Text('Your Email'),
                      //     hintText: 'Enter Email',
                      //     hintStyle: const TextStyle(
                      //       color: Colors.black26,
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderSide: const BorderSide(
                      //         color: Colors.black12, // Default border color
                      //       ),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: const BorderSide(
                      //         color: Colors.black12, // Default border color
                      //       ),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 25.0),
                      // const Padding(
                      //   padding: EdgeInsets.only(right: 190),
                      //   child: Text('Your Password',style: TextStyle(fontStyle: FontStyle.italic),),
                      // ),
                      // TextFormField(
                      //   obscureText: true,
                      //   obscuringCharacter: '*',
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter Password';
                      //     }
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     // focusColor: AppColors.secondaryTextColor,
                      //     fillColor: AppColors.secondaryTextColor,
                      //     label: const Text('Your Password'),
                      //     hintText: 'Enter Password',
                      //     hintStyle: const TextStyle(
                      //       color: Colors.grey,
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderSide: const BorderSide(
                      //         color: Colors.black12, // Default border color
                      //       ),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: const BorderSide(
                      //         color: Colors.black12, // Default border color
                      //       ),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 10.0),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Checkbox(
                      //           value: rememberPassword,
                      //           onChanged: (bool? value) {
                      //             setState(() {
                      //               rememberPassword = value!;
                      //             });
                      //           }, //////////
                      //           activeColor: AppColors.secondaryTextColor,
                      //         ),
                      //         const Text(
                      //           'Remember me',
                      //           style: TextStyle(
                      //             color: Colors.black45,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {
                      //         //navigate to forget password screen
                      //         nextScreen(context, FadeAnimate(ForgetPasswordPage()));
                      //       },
                      //       child: Text(
                      //         'Forget password?',
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           color: AppColors.secondaryTextColor,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const Text('Enter your phone number to register'),
                      const SizedBox(height: 40,),
                      numberFormField(_numberController), 
                      const SizedBox(height: 25.0),
                      PrimaryButton(
                        text: 'SIGN UP',
                        onPressed: () async {
                          if (!_formSignInKey.currentState!.validate()) {
                            return; // Exit if form validation fails
                          }

                          if (!rememberPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please agree to the processing of personal data')),
                            );
                            return;
                          }

                          // Show processing message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data...')),
                          );
                          //Look up on the int section below
                          nextScreen(context, SlideAnimate(UserOTPPage(phoneNumber: 0,)));

                          //FUNCTIONS FOR BETTER VALIDATIONS & FIREBASE
                          // Simulated authentication function
                          // final loginResult = await authenticateUser(emailController.text, passwordController.text);

                          // if (loginResult == 'success') {
                          //   // Navigate to homepage if login is successful
                          //   nextScreen(context, FadeAnimate(const Dashboard()));
                          // } else if (loginResult == 'wrong_credentials') {
                          //   // Show error if credentials are incorrect
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(content: Text('Incorrect email or password. Please try again.')),
                          //   );
                          // } else if (loginResult == 'user_not_found') {
                          // Route to signup if user is not found
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text(
                          //         'User not found. Please register first.'),
                          //   ),
                          // );
                          // }
                        },
                      ),

                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5))),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                                  thickness: 0.7,
                                  color: Colors.grey.withOpacity(0.5))),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // children: [
                        //   Logo(Logos.facebook_f, size: 40),
                        //   Logo(Logos.twitter, size: 40),
                        //   Logo(Logos.google, size: 40),
                        //   Logo(Logos.apple, size: 40),
                        // ],
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an Account? ',
                            style: TextStyle(color: Colors.black45),
                          ),
                          GestureDetector(
                            onTap: () {
                              nextScreen(
                                  context, SlideAnimate(const UserLogin()));
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
