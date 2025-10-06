import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:post/common_widgets/custom_button.dart';
import 'package:post/common_widgets/custom_text_field.dart';
import 'package:post/view/auth/login_screen/login_page.dart';
import 'package:post/view/auth/signup/changepassword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  DateTime? selectedDate;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFCF2B1D),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  LinearGradient get _mainGradient => LinearGradient(
        colors: [Color(0xff02447F), Color(0xff000427)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
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
                  padding: EdgeInsets.fromLTRB(12, 5, 12, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Register Now",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(221, 4, 0, 16),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Center(
                              child: Text(
                                "Fill the required details for Registration",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),

                            CustomTextFormField(
                              controller: firstNameController,
                              label: "First Name*",
                              hintText: "Enter First Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "First name is required";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),

                            CustomTextFormField(
                              controller: lastNameController,
                              label: "Last Name*",
                              hintText: "Enter Last Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Last name is required";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),

                            Text(
                              "Date of Birth*",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 6),

                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Select your DOB",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    suffixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Color(0xFFCF2B1D),
                                    ),
                                  ),
                                  controller: TextEditingController(
                                    text: selectedDate == null
                                        ? ""
                                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Date of Birth is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 15),

                            CustomTextFormField(
                              controller: emailController,
                              label: "Email*",
                              hintText: "abc@email.com",
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
                            SizedBox(height: 35),

                            CustomButton(
                              text: "Next Page",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (context) => changepassword(),
                                    ),
                                  );
                                }
                              },
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
            ],
          ),
        ),
      ),
    );
  }
}
