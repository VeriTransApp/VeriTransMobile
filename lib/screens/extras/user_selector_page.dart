import 'package:flutter/material.dart';
import 'package:veritransmobile/screens/authentication/driver_authentication/dlogin_page.dart';
import 'package:veritransmobile/utils/general_widgets/components.dart';

import '../../animation/slideanimate.dart';
import '../authentication/user_authentication.dart/ulogin_page.dart';

class UserSelector extends StatelessWidget {
  const UserSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(image: AssetImage('assets/images/vlogo.jpeg')),
          const SizedBox(height: 170,),
          PrimaryButton(text: 'DRIVER', onPressed: (){
            nextScreen(context, SlideAnimate(const DriverLogin()));
          }),
          const SizedBox(height: 20,),
          PrimaryButton(text: 'USER', onPressed: (){
            nextScreen(context, SlideAnimate(const UserLogin()));
          }),
        ],
      ),
    );
  }
}