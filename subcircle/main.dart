import 'package:flutter/material.dart';
import 'package:post/view/auth/dashboard/HomePage.dart';
import 'package:post/view/auth/dashboard/choose_category_page.dart';
import 'package:post/view/auth/login_screen/login_main.dart';
import 'package:post/view/auth/login_screen/login_page.dart';
import 'package:post/view/auth/login_screen/login_seller.dart';
import 'package:post/view/auth/signup/changepassword.dart';
import 'package:post/view/auth/signup/signup.dart';
import 'package:post/view/auth/splash/splash.dart';
import 'package:post/view/auth/login_screen/pop_up_subscription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"subscircle",
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash':(context) => SplashScreen(),
        '/': (context) => LoginPage(),
        '/signup': (context) => Signup(),
        '/loginseller': (context) => LoginSeller(),
        '/RoleScetionPage': (context) => RoleSelectionPage(),
        '/changepassword': (context) => changepassword(),
        '/SubscriptionPopup': (context) => SubscriptionPopup(),
        '/ChooseCategoryPage':(context) => ChooseCategoryPage(),
        '/HomePage':(context) => HomePage(),
      },
    );
  }
}
