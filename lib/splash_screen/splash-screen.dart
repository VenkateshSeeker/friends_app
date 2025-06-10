import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../login_page/login_page.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: mediaQ.height,
            width: mediaQ.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage("assets/night.jpg"),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      "Find\nYour\nConnection",
                      textScaler: TextScaler.linear(0.7),
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 70, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 32),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: mediaQ.width / 1.6,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0xfff73b4f),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: -30,
                                bottom: 12,
                                child: Container(
                                  width: 40,
                                  height: 20,
                                  color: AppColors.buttonColor,
                                ),
                              ),
                              Positioned(
                                right: -60,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.buttonColor,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
