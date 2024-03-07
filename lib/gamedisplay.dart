// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qtlite/models/game.dart';
import 'package:qtlite/models/template.dart';

Future<Game> getGameData() async {
  var url =
      Uri.parse('http://10.0.2.2:5000/api/v1/games/656ed3cfaceb24ece040fdd5');
  var response = await http.get(url);
  Map<String, dynamic> data = jsonDecode(response.body);
  // print((data));

  return Game.fromJson(data);
}

class GameDisplay extends StatefulWidget {
  const GameDisplay({super.key});

  @override
  State<GameDisplay> createState() => _GameDisplayState();
}

class _GameDisplayState extends State<GameDisplay> {
  Game _game = Game(
      title: "testgame",
      summary: "asdf",
      developers: ["asdf"],
      publishers: ["asdf"],
      releaseYear: 2003,
      platforms: ["NES"],
      templates: [Template(title: "testTemplate", creator: "Eukaryotic")]);

  void _genGameData() async {
    var newGame = await getGameData();
    setState(() {
      _game = newGame;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child:
                Align(alignment: Alignment.center, child: Text(_game.title))),
        Expanded(
            child: Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: _genGameData,
                    child: Text(softWrap: true, "Load Game!")))),
      ],
    );
  }
}
