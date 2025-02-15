import 'package:flutter/material.dart';
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
          Image(image: AssetImage('assets/images/vlogo.jpeg')),
          SizedBox(height: 50,),
          PrimaryButton(text: 'DRIVER', onPressed: (){
            nextScreen(context, SlideAnimate(const UserLogin()));
          }),
          SizedBox(height: 20,),
          PrimaryButton(text: 'CUSTOMER', onPressed: (){}),
        ],
      ),
    );
  }
}