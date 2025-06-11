import 'package:flutter/material.dart';

import '../chat_screen/chat_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_page/profile_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ChatScreen(),
    Center(child: Text('Profile Screen')),
    ProfilePage(),
  ];

  // void _onTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      // add more cases as needed
    }
  }

  List<IconData> icons = [Icons.home, Icons.chat, Icons.person, Icons.settings];

  List<String> labels = ['Discover', 'Chat', 'Profile', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xff000000),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(13).copyWith(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade700),
          color: Color(0xff101012),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(icons.length, (index) {
            return InkWell(
              onTap: () => _onTabTapped(index),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[index],
                      color: _currentIndex == index
                          ? Colors.white
                          : Color(0xff74767a),
                    ),
                    SizedBox(width: 5),
                    _currentIndex == index
                        ? Text(
                            labels[index],
                            style: TextStyle(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Color(0xff74767a),
                              fontSize: 14,
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
