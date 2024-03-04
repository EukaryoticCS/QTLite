// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qtlite/models/template.dart';
import 'searchbar.dart';
import 'templateslist.dart';
import 'page.dart' as qtlite_page;
import 'homepage.dart';

final _router = GoRouter(routes: [
  
  GoRoute(
    path: '/templates',
    builder: (context, state) => qtlite_page.Page(
      bottomNavBarIndex: 0,
      body: TemplatesList(
        templates: [
          Template(title: "Ocarina of Time 100%", creator: "Eukaryotic"),
          Template(
              title: "Halo: Combat Evolved All Achievements",
              creator: "Eukaryotic")
        ],
      ),
    ),
  ),
  GoRoute(path: '/', builder: (context, state) => MyHomePage(title: 'QTLite')),
  GoRoute(
      path: '/profile',
      builder: (context, state) => qtlite_page.Page(bottomNavBarIndex: 2,
          body: Checkbox(value: true, onChanged: (bool? newChecked) => {})))
]);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData =
        ThemeData(useMaterial3: true, brightness: Brightness.dark);
    return MaterialApp.router(
      routerConfig: _router,
      // Application name
      title: 'QTLite',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: themeData,
    );
  }
}
