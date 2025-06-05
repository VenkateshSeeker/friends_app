import 'package:flutter/material.dart';
import 'package:project/nav_bar/nav_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        width: mediaQ.width,
        height: mediaQ.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffff6666), Color(0xffe37984)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Image.asset(
                "assets/login.png",
                width: mediaQ.width,
                height: mediaQ.height * 0.3,
                // fit: BoxFit.cover,
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
                  color: Color(0xffe37984),
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
                  color: Color(0xffe37984),
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
                    color: Color(0xff471d21),
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
                  border: Border.all(color: Color(0xffa3434c)),
                  borderRadius: BorderRadius.circular(60),
                  color: Color(0xffa3434c),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/google.png", width: 30, height: 30),
                    SizedBox(width: 13),
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
                  SizedBox(width: 10),
                  Text(
                    "Sign up",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
