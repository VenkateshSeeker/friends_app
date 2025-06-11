import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../chat_screen/chat_screen.dart';
import '../core/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.gryLightColor,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: mediaQ.height * 0.2,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.gryLightColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                bottom: -90,
                child: Container(
                  height: 450,
                  width: mediaQ.width / 1.1,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    border: Border.all(color: AppColors.gryLightColor),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.buttonColor.withOpacity(0.2),
                        blurRadius: 95,
                        offset: Offset(0, 15),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              "https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=0&k=20&c=tyLvtzutRh22j9GqSGI33Z4HpIwv9vL_MZw_xOE19NQ=",
                              width: 120,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Debabrata Dutta",
                                style: GoogleFonts.inter(
                                  fontSize: 23,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Associate Software Engineer",
                                style: GoogleFonts.inter(
                                  fontSize: 17,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: mediaQ.width / 2.0,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.gryLightColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Activity",
                                          style: GoogleFonts.inter(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "36",
                                          style: GoogleFonts.inter(
                                            fontSize: 25,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Activity",
                                          style: GoogleFonts.inter(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "36",
                                          style: GoogleFonts.inter(
                                            fontSize: 25,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Activity",
                                          style: GoogleFonts.inter(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "36",
                                          style: GoogleFonts.inter(
                                            fontSize: 25,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => ChatScreen()),
                              );
                            },
                            child: Expanded(
                              child: Container(
                                width: mediaQ.width / 2.0 - 12,
                                padding: EdgeInsets.all(12),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                                child: Text(
                                  "Chat",
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              width: mediaQ.width / 2.0 - 12,
                              padding: EdgeInsets.all(12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: AppColors.buttonColor,
                                ),
                              ),
                              child: Text(
                                "Follow",
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
