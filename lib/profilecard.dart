// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qtlite/models/profile.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.profile});

  final profile;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(32), child: Scaffold());
  }
}
