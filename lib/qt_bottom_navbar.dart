import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QTBottomNavBar extends StatefulWidget {
  const QTBottomNavBar({super.key});

  @override
  State<QTBottomNavBar> createState() => _QTBottomNavBarState();
}

class _QTBottomNavBarState extends State<QTBottomNavBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          context.go('/Templates');
        case 1:
          context.go('/');
        case 2:
          context.go('/Profile');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.check_box), label: "Templates"),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports), label: "Games"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "Profile")
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.purpleAccent,
      onTap: _onItemTapped,
    );
  }
}
