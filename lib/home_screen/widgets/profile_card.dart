import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.of(context).size;
    return Container(
      height: mediaQ.height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.2),
            blurRadius: 25,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipPath(
        clipper: CardShapeClipper(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Background Image
            Image.network(
              profile.imageUrl,
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: double.maxFinite,
            ),

            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
              ),
            ),

            // User Info & Cloud Row
            Positioned(
              bottom: 120,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.cloud, color: Colors.white, size: 20),
                      SizedBox(width: 5),
                      Text(
                        "95%",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${profile.name}, ${profile.age}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 16),
                      SizedBox(width: 5),
                      Text(
                        "${profile.distance} km away",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Action Buttons
            Positioned(
              bottom: -25,
              left: 30,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.white.withOpacity(0.85),
                    child: Icon(Icons.close, color: Colors.black, size: 28),
                  ),
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.favorite, color: Colors.white, size: 34),
                  ),
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.white.withOpacity(0.85),
                    child: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Profile {
  final String name;
  final int age;
  final double distance;
  final String imageUrl;

  Profile({
    required this.name,
    required this.age,
    required this.distance,
    required this.imageUrl,
  });
}

class CardShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveHeight = 30;

    Path path = Path();
    path.moveTo(0, curveHeight);
    path.quadraticBezierTo(0, 0, curveHeight, 0);
    path.lineTo(size.width - curveHeight, 0);
    path.quadraticBezierTo(size.width, 0, size.width, curveHeight);
    path.lineTo(size.width, size.height - 70);
    path.quadraticBezierTo(size.width / 2, size.height, 0, size.height - 70);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
