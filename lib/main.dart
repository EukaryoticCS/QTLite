// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:qtlite/models/template.dart';
import 'package:qtlite/profilepage.dart';
import 'package:qtlite/settingspage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'templateslist.dart';
import 'page.dart' as qtlite_page;
import 'homepage.dart';

final screens = [
  qtlite_page.Page(
      body: TemplatesList(templates: [
    Template(title: "Ocarina of Time 100%", creator: "Eukaryotic"),
    Template(
        title: "Halo: Combat Evolved All Achievements", creator: "Eukaryotic")
  ])),
  MyHomePage(title: 'QTLite'),
  MyProfilePage(),
  MySettingsPage()
];

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isDarkMode = false;
  int _currentIndex = 0;

  setDarkMode() async {
    final darkMode = await SharedPreferences.getInstance()
        .then((preferences) => preferences.getBool("isDarkMode"));
    setState(() => _isDarkMode = darkMode ?? false);
  }

  @override
  Widget build(BuildContext context) {
    setDarkMode();

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("QTLite"),
            centerTitle: true,
          ),
          body: screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_box), label: "Templates"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_esports), label: "Games"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings")
            ],
            currentIndex: _currentIndex,
            backgroundColor: Colors.blueGrey,
            onTap: (index) => setState(() => _currentIndex = index),
          ),
        ),
        theme: ThemeData(
            brightness: Brightness.light,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.purple,
                selectedIconTheme: IconThemeData(color: Colors.purpleAccent),
                unselectedIconTheme: IconThemeData(color: Colors.black))),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.purple,
            selectedIconTheme: IconThemeData(color: Colors.purpleAccent),
            unselectedIconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
