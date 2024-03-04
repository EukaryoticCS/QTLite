// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<String> getKanyeQuote() async {
//   String quote = await http.get(Uri(path: "https://api.kanye.rest")).toString();
//   return "";
// }

// class GameDisplay extends StatefulWidget {
//   const GameDisplay({super.key});

//   @override
//   State<GameDisplay> createState() => _GameDisplayState();
// }

// class _GameDisplayState extends State<GameDisplay> {
//   Future<String> _quote = Future(() => "");

//   @override
//   void initState() {
//     super.initState();
//     _quote = getKanyeQuote();
//   }

//   void _retry() {
//     setState(() {
//       _quote = getKanyeQuote();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder<String>(
//           future: _quote,
//           builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//             if (snapshot.hasData) {
//               return Text("Here's a Kanye quote: ${snapshot.data}");
//             } else {
//               return Text("");
//             }
//           }),
//     );
//   }
// }
