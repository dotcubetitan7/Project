import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SetPasswordPage(),
    );
  }
}

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});
  

  TextEditingController? get inputcontroller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
        ),
      ),
      backgroundColor: const Color(0xFF1B1931),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/Armpoint.jpg',
                      fit: BoxFit.fitWidth,
                      height: 200,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 0),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Container(
                  height: 497,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 229, 223, 223),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Login to your account",
                          style: TextStyle(
                            fontSize: 27.02,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1B1931),
                          ),
                        ),
                      ),
                       SizedBox(height: 40),
                       Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1B1931),
                        ),
                      ),
                      SizedBox(height: 4),
                      TextField(
                        controller: inputcontroller,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(fontSize: 14),

                        decoration: InputDecoration(
                          hintText: 'abc@email.com',
                          hintStyle: const TextStyle(color: Color(0xFF858585)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Enter Password",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1B1931),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '*********',
                          hintStyle: const TextStyle(color: Color(0xff858585)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xffD51919),
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF201E33),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/');
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          "By signing up I agree to the Terms and \n Conditions and Privacy Policy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff1B1931),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
