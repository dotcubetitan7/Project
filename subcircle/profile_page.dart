import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff082032),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "assets/Frame.png",
                      height: 40,
                    ),
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/user.png"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Titan",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: 
                    Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              decoration: 
              BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text("My Orders"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("FAQ's"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.support_agent),
                    title: Text("Help & Support"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite_border),
                    title: Text("Wishlist"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock_outline),
                    title: Text("Change Password"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.description_outlined),
                    title: Text("Terms & Condition"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip_outlined),
                    title: Text("Privacy Policy"),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
