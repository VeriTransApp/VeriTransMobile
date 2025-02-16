import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:veritransmobile/screens/extras/app_colors.dart';
import 'package:veritransmobile/screens/extras/onboarding.dart';

void main() async {
  //these ensure the splash screen works (icon that appears when app is launched)
  //we havent decided on the logo yet
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VeriTrans',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondaryTextColor), //secondary text color is the green
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

