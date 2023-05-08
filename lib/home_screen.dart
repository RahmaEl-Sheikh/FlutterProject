import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';
import 'custom_app_bar.dart';
import 'movies_tab.dart';
import 'TVTab.dart';
Widget HomeScreen() {
  return Center(
    child: Text('Roro'),
  );
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomNavBar(),
        body: TabBarView(children: [
          MoviesTab(),
          TvTab(),
          Center(child: Text('Profile Tab')),
        ]),
      ),
    );
  }
}