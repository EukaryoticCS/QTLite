// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page.dart' as qtlite_page;

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({super.key});

  @override
  State<MySettingsPage> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettingsPage> {
  bool _isDarkMode = false;

  getDarkMode() {
    final preferencesFuture = SharedPreferences.getInstance();
    preferencesFuture.then((preferences) =>
        {_isDarkMode = preferences.getBool("isDarkMode") ?? false});
  }

  setDarkMode(bool isDarkMode) {
    final preferencesFuture = SharedPreferences.getInstance();
    preferencesFuture
        .then((preferences) => {preferences.setBool("isDarkMode", isDarkMode)});
    setState(() => _isDarkMode = isDarkMode);
  }

  @override
  void initState() {
    super.initState();
    getDarkMode();
  }

  @override
  Widget build(BuildContext context) {
    return qtlite_page.Page(
      body: Scaffold(
        body: Center(
          child: Row(
            children: [
              Text("Dark Mode: "),
              Checkbox(
                value: _isDarkMode,
                onChanged: (bool? newChecked) => {setDarkMode(!_isDarkMode)},
              )
            ],
          ),
        ),
      ),
    );
  }
}
