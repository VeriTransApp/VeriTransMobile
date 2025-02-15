import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart' as intro;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veritransmobile/screens/extras/user_selector_page.dart';
import 'package:veritransmobile/utils/general_widgets/components.dart';
import '../../animation/slideanimate.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Define your list of pages using the package’s PageViewModel
  final List<intro.PageViewModel> listPagesViewModel = [
    intro.PageViewModel(
      title: "Pick the type of ride you want",
      bodyWidget: const Text(
        'Ride Options',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      image: Center(child: Image.asset('assets/images/intro1.png')),
    ),
    intro.PageViewModel(
      title: "Get Access to Electric Vehicles, Flight Booking and More",
      bodyWidget: const Text(
        'Stay Connected',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      image: Center(child: Image.asset('assets/images/intro2.png')),
    ),
    intro.PageViewModel(
      title: "Get a Ride Anytime, Anywhere",
      bodyWidget: const Text(
        'Welcome to VeriTrans',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      image: Center(child: Image.asset('assets/images/intro3.png')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Make the AppBar transparent or remove it if you don’t need it.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: intro.IntroductionScreen(
        dotsDecorator: intro.DotsDecorator(activeColor: Colors.blue[900]),
        pages: listPagesViewModel,
        showSkipButton: true,
        showNextButton: true,
        showDoneButton: true,
        skip: const Text("Skip", style: TextStyle(color: Colors.black),),
        next: Text('Next', style: TextStyle(color: Colors.blue[900]),),
        done: Text("Finish", style: TextStyle(color: Colors.blue[900]),),
        onDone: () async {
          // Save a flag in SharedPreferences so that you don't show the intro again
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('intro', false);

          // Navigate to LoginPage (ensure LoginPage is imported or defined)
          nextScreen(context, SlideAnimate(const UserSelector()));
        },
      ),
    );
  }
}

