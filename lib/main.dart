import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 21, 50),
      appBar: PreferredSize(preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 190,
              child: Image.asset('assets/Armpoint.jpg',
              fit: BoxFit.cover,
              height: 400,
              ),
            )
          ],
        ),)
    );
  }
}