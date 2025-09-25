import 'package:flutter/material.dart';
import 'package:post/loginscreen/login_main.dart';
import 'package:post/loginscreen/login_page.dart';
import 'package:post/loginscreen/login_seller.dart';
import 'package:post/splash/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash':(context) => const SplashScreen(),
        '/': (context) => const LoginPage(),
        '/loginseller': (context) => const LoginSeller(),
        '/RoleScetionPage': (context) => const RoleSelectionPage(),
      },
    );
  }
}
