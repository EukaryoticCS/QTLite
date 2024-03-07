import 'package:isar/isar.dart';

part 'profile.g.dart';

@collection
class Profile {
  Id id = Isar.autoIncrement;
  String username;
  String favoriteGame;

  Profile({required this.username, required this.favoriteGame});
}