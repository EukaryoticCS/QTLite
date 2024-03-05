// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:qtlite/models/template.dart';
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
  qtlite_page.Page(
      body: Checkbox(
    value: true,
    onChanged: (bool? newChecked) => {},
  ))
];

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                icon: Icon(Icons.account_circle), label: "Profile")
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.purpleAccent,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
