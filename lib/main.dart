import 'package:flutter/material.dart';
import 'package:ismail_recipe_app_2/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onBoardingScreen(),
    );
  }
}

