import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController? LastNameController;
    TextEditingController? FirstNameController;


  TextEditingController? get emailController => null;
  
  TextEditingController? get numberController => null;


   void _handleLogin(dynamic passController, dynamic _formKey) {
    if (_formKey.currentState!.validate()) {
      String? email = emailController?.text.trim();
      String password = passController.text.trim();

      debugPrint("Email: $email");
      debugPrint("Password: $password");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful")),
      );

    }
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: const Color(0xff1B1931),
        ),
      ),


      backgroundColor: const Color(0xFF1B1931),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                children: [
                Image.asset(
                'assets/Armpoint.jpg',
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
              ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 232, 227, 227),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Create your Account",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      
                       const Text(
                          "First Name*",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff1B1931),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: FirstNameController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Enter Here',
                            hintStyle: const TextStyle(color: Color(0xFF858585)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "First Name is Required..";
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return "First Name is required..";
                            }
                            return null;
                          },
                        ), SizedBox(height: 12,),

                        const Text(
                          "Last Name*",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff1B1931),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: LastNameController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Enter Here',
                            hintStyle: const TextStyle(color: Color(0xFF858585)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Last Name is Required";
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return "Enter a valid Name";
                            }
                            return null;
                          },
                        ), SizedBox(height: 12,),


                        const Text(
                          "Date Of Birth*",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff1B1931),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'DOB',
                            hintStyle: const TextStyle(color: Color(0xFF858585)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter email";
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ), SizedBox(height: 12),

                          const Text(
                          "Email*",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff1B1931),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'abc@email.com',
                            hintStyle: const TextStyle(color: Color(0xFF858585)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter email";
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ), SizedBox(height: 12),

                        

                        const Text(
                          "Mobile Number*",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff1B1931),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: numberController,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Enter Mobile Number',
                            hintStyle: const TextStyle(color: Color(0xFF858585)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Mobile Number is required..";
                            }
                            if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                              return "Enter valid 10 digit number..";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40),

              
                      SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 22, 14, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {  },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),SizedBox(height: 20),

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
                        ),SizedBox(height: 25,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  


}
