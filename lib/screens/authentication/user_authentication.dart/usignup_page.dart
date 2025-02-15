import 'package:flutter/material.dart';
import 'package:veritransmobile/animation/slideanimate.dart';
import 'package:veritransmobile/controllers/form_fields_controller.dart';
import 'package:veritransmobile/screens/authentication/user_authentication.dart/ulogin_page.dart';
import 'package:veritransmobile/screens/authentication/user_authentication.dart/usignup_page.dart';

import '../../../utils/general_widgets/components.dart';
import '../../extras/app_colors.dart';
import '../../extras/custom_scaffold.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({super.key});

  @override
  State<UserSignup> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserSignup> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child:
     Column(
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
                      const Text('Sign Up'),
                      const Text(
                        'New User?',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      // const Padding(
                      //   padding: EdgeInsets.only(right: 270),
                      //   child: Text('Your Email',style: TextStyle(fontStyle: FontStyle.italic),),
                      // ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Your Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      // const Padding(
                      //   padding: EdgeInsets.only(right: 190),
                      //   child: Text('Your Password',style: TextStyle(fontStyle: FontStyle.italic),),
                      // ),
                      const PasswordFormField(),    
                      const SizedBox(height: 25.0),
                      numberFormField(_numberController),                    
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Have an account? ',
                            style: TextStyle(color: Colors.black45),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (e) => const UserSignup()),
                              );
                            },
                            child: GestureDetector(
                              onTap: (){
                                //make sure to pay atttention to the signin and login terms here
                                nextScreen(context, SlideAnimate(const UserLogin()));},
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      PrimaryButton(
                        text: 'SIGN UP',
                        onPressed: () {
                          if (_formSignInKey.currentState!.validate() && rememberPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Processing Data'),
                              ),
                            );
                          } else if (!rememberPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please agree to the processing of personal data')),
                            );
                          }
                        },
                      ),
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