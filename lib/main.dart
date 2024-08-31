import 'package:core/styles/themes/light_theme.dart';
import 'package:Dinar/screens/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      theme: lightTheme,
      home: const OnboardingScreen(),
    );
  }
}
