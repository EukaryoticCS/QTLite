// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TemplatesList extends StatelessWidget {
  const TemplatesList({super.key, required this.templates});

  final templates;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: ListView.builder(
        itemCount: templates.length,
        prototypeItem: ListTile(
            title: Text(templates[0].title),
            subtitle: Text(templates[0].creator)),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(templates[index].title),
            subtitle: Text(templates[index].creator),
          );
        },
      ),
    );
  }
}
