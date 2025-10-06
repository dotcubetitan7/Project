import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/loginseller',
        (Route<dynamic> route) => false,
      );
     }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0C3C78), Color(0xFF00163A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset(
            "assets/Frame.png",
            height: 80,
            width: 189,
          ),
        ),
      ),
    );
  }
}
