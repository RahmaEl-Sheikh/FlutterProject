import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.deepOrange,
      labelColor: Colors.deepOrange,
      tabs: [
        Tab(
          icon: ImageIcon(
            AssetImage(
              'assets/images/tab1.png',
            ),
            size: 24.0,
            color: Colors.grey,
          ),
          text: 'Movies',
        ),
        Tab(
          icon: ImageIcon(
            AssetImage(
              'assets/images/tv.png',
            ),
            size: 24.0,
            color: Colors.grey,
          ),
          text: 'TV',
        ),
        Tab(
          icon: ImageIcon(
            AssetImage(
              'assets/images/profile.png',
            ),
            size: 24.0,
            color: Colors.grey,
          ),
          text: 'Profile',
        ),
      ],
    );
  }
}