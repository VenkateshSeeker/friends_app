import 'package:flutter/material.dart';
import 'package:project/login_page/widgets/meteor_sower.dart';
import 'package:project/nav_bar/nav_bar.dart';

import '../sign_up/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        width: mediaQ.width,
        height: mediaQ.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.bottomCenter,
            colors: [Color(0xff000000), Color(0xff541218)],
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            // Your GIF image
                            Image.asset(
                              "assets/login.gif",
                              width: mediaQ.width,
                              height: mediaQ.height * 0.3,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              height:
                                  80, // Adjust this for how much of a fade you want
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.8),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 40, color: Colors.white),
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
                  Text(
                    "Lorem Ipsum is simply dummy text of ",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 14),
                  Container(
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your email",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your password",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => NavBar()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: mediaQ.width,
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Color(0xfff73b4f),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  Container(
                    width: mediaQ.width,
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff452326)),
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xff452326),
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/google.png", width: 30, height: 30),
                        SizedBox(width: 18),
                        Text(
                          "Google Login",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: Text("Sign Up", style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 15,
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.9,
                  child: MeteorShower(
                    numberOfMeteors: 50,
                    duration: Duration(seconds: 5),
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
