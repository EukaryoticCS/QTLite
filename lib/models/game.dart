import 'package:qtlite/models/template.dart';

class Game {
  String title;
  String summary;
  List<String> developers;
  List<String> publishers;
  int releaseYear;
  List<String> platforms;
  List<Template> templates = [];

  factory Game.fromJson(Map<String, dynamic> data) {
    return Game(
        title: data["title"],
        summary: data["summary"],
        developers: List<String>.from(data["developers"]),
        publishers: List<String>.from(data["publishers"]),
        releaseYear: data["releaseYear"],
        platforms: List<String>.from(data["platforms"]),
        templates: List<Template>.from(data["templates"]));
  }

  Game(
      {required this.title,
      required this.summary,
      required this.developers,
      required this.publishers,
      required this.releaseYear,
      required this.platforms,
      required this.templates});
}
