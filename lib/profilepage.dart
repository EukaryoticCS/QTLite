// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qtlite/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page.dart' as qtlite_page;

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfilePage> {
  Profile profile = Profile(username: "Eukaryotic", favoriteGame: "Spelunky");

  getProfile() async {
    final directory = await getApplicationDocumentsDirectory();
    final isar = await Isar.open([ProfileSchema], directory: directory.path);

    final existingUser = await isar.profiles.get(profile.id);
    print(existingUser?.username);
  }

  addProfileToIsar() async {
    final directory = await getApplicationDocumentsDirectory();
    final isar = await Isar.open([ProfileSchema], directory: directory.path);
    isar.writeTxn(() async {
      await isar.profiles.put(profile);
    });
  }

  @override
  Widget build(BuildContext context) {
    addProfileToIsar().then(getProfile());
    return qtlite_page.Page(
      body: Scaffold(
        body: Row(
          children: [
            Text("Welcome to the Profile Page"),
          ],
        ),
      ),
    );
  }
}
