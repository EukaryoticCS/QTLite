// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qtlite/gamedisplay.dart';
import 'page.dart' as qtlite_page;

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return qtlite_page.Page(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            clipBehavior: Clip.none,
            shape: const StadiumBorder(),
            scrolledUnderElevation: 0.0,
            titleSpacing: 0.0,
            backgroundColor: Colors.transparent,
            pinned: true,
            title: SearchAnchor.bar(
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                return List<Widget>.generate(
                  5,
                  (int index) {
                    return ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Text('Initial List Item $index'),
                    );
                  },
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 100.0,
                      child: Card(child: Center(child: Text('Card $index'))),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100.0,
              child: GameDisplay(),
            ),
          ),
        ],
      ),
    );
  }
}
