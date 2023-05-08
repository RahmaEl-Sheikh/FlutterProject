import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key ?key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('CineGuide'),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Image.asset(
            'assets/images/movie.png',
            width: 24.0,
            height: 24.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}