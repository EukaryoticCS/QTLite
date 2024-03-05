import 'package:flutter/material.dart';
import 'package:qtlite/qt_bottom_navbar.dart';

class Page extends StatelessWidget {
  const Page({super.key, required this.body, 
  // required this.bottomNavBarIndex
  });

  final Widget body;
  // final int bottomNavBarIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Expanded(child: body)]),
      // bottomNavigationBar: QTBottomNavBar(bottomNavBarIndex: bottomNavBarIndex)
    );
  }
}
