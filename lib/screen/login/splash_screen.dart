
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF271946),
      body: Center(
        child: SizedBox(
          height: 107,
          width: 95,
          child: Image.asset('assets/images/Logo.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}