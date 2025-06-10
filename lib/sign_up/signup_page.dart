import 'package:flutter/material.dart';
import 'package:project/login_page/login_page.dart';

import '../nav_bar/nav_bar.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.bottomCenter,
            colors: [Color(0xff1a0500), Color(0xff541218)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 320,
                  width: 350,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/signup.png",
                      ), // 👉 your image asset here
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Sign Up ",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    SizedBox(width: 10),

                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Name Field
                buildTextField(mediaQ, "Enter your name"),
                SizedBox(height: 20),

                // Email Field
                buildTextField(mediaQ, "Enter your email"),
                SizedBox(height: 20),

                // Password Field
                buildTextField(
                  mediaQ,
                  "Enter your password",
                  obscureText: true,
                ),
                SizedBox(height: 40),

                // SIGN UP BUTTON
                SizedBox(
                  width: mediaQ.width,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xfff73b4f),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBar(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 60),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text("Log In", style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    Size mediaQ,
    String hintText, {
    bool obscureText = false,
  }) {
    return Container(
      width: mediaQ.width,
      height: 55,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff593538)),
        borderRadius: BorderRadius.circular(60),
        color: Color(0xff452326),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade100),
        ),
      ),
    );
  }
}
