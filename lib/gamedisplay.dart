// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> getKanyeQuote() async {
  var url = Uri.https('api.kanye.rest');
  var response = await http.get(url);
  var data = jsonDecode(response.body);

  return data["quote"];
}

class GameDisplay extends StatefulWidget {
  const GameDisplay({super.key});

  @override
  State<GameDisplay> createState() => _GameDisplayState();
}

class _GameDisplayState extends State<GameDisplay> {
  String _quote = "";

  void _genQuote() async {
    var newQuote = await getKanyeQuote();
    setState(() {
      _quote = newQuote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Align(alignment: Alignment.center, child: Text(_quote))),
        Expanded(
            child: Align(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: _genQuote,
                    child: Text(softWrap: true, "Generate Quote!")))),
      ],
    );
  }
}
