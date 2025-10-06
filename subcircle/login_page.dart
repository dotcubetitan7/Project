import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:post/common_widgets/custom_button.dart';
import 'package:post/view/auth/dashboard/HomePage.dart';
import 'package:post/view/auth/signup/signup.dart';
import '../../../common_widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPagestate();
}

class _LoginPagestate extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  LinearGradient get _mainGradient => LinearGradient(
        colors: [Color(0xff02447F), Color(0xff000427)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: 
        Container(
        decoration: BoxDecoration(
          gradient: _mainGradient,
        ),
        child: SafeArea(
          bottom: true,
          child: Column(
            children: [
              SizedBox(
                height: 250,

                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/Frame.png', 
                        height: 80,
                        width: 190,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: SafeArea(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Center(
                                child: Text(
                                  "Login to your account",
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(221, 4, 0, 16),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),

                              CustomTextFormField(
                                controller: emailController,
                                label: "Email",
                                hintText: "abc@email.com",
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Email is required";
                                  }
                                  final emailRegex =
                                      RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                  if (!emailRegex.hasMatch(value)) {
                                    return "Enter a valid email";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),

                              CustomTextFormField(
                                controller: passwordController,
                                label: "Enter Password",
                                hintText: "**********",
                                isObscure: false, 
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Password is required";
                                  }
                                  if (value.length < 8) {
                                    return "Password must be at least 8 characters";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10),

                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(
                                        context, '/changepassword');
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Color(0xFFCF2B1D),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),

                              CustomButton(
                                text: "Login",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (context) => HomePage(),
                                      ),
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 20),

                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'New User? ',
                                    style: 
                                     TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Register Now',
                                        style: 
                                         TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF040404),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Signup(),
                                              ),
                                            );
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'By signing up I agree to the ',
                                    style: TextStyle(
                                      color: Color(0xFF757575),
                                      fontSize: 12,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            'Terms and Conditions and Privacy Policy',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF757575),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LoginPage(),
                                              ),
                                            );
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
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