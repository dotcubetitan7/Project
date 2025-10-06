import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:post/view/auth/dashboard/HomePage.dart';
import 'package:post/view/auth/login_screen/login_page.dart';
import 'package:post/common_widgets/custom_button.dart';

class SubscriptionPopup extends StatefulWidget {
  const SubscriptionPopup({super.key});

  @override
  State<SubscriptionPopup> createState() => _SubscriptionPopupState();
}

class _SubscriptionPopupState extends State<SubscriptionPopup> {
  final _formKey = GlobalKey<FormState>();

  bool _perkOffer = true;
  bool _referralOffer = true;

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
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: _mainGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: Center(
                  child: Image.asset(
                    'assets/Frame.png',
                    height: 80,
                    width: 190,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          
                          Text(
                            "Become a member to get access to perks from your favorite creators.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 30),

                          Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "What you’ll get",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                                Divider(),
                                
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text("Perk offers \$5 off/month"),
                                    ),
                                    Switch(
                                      value: _perkOffer,
                                      activeColor: Colors.red,
                                      onChanged: (value) {
                                        setState(() => _perkOffer = value);
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "Referrals offer \$1/month (Max of \$10)"),
                                    ),
                                    Switch(
                                      value: _referralOffer,
                                      activeColor: Colors.red,
                                      onChanged: (value) {
                                        setState(() => _referralOffer = value);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),

                          CustomButton(
                            text: "Subscribe",
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
                          SizedBox(height: 12),
                          
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
                                            builder: (context) =>
                                                LoginPage(),
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
            ],
          ),
        ),
      ),
    );
  }
}
