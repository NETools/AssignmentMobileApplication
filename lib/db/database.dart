//The class shall be responsible to store the GoT characters loaded from the API in a database
import 'package:hive_flutter/adapters.dart';
import 'package:ue1_basisprojekt/db/character.dart';

class Database {
  Future<List<Character>> get storedCharacters async {
    var box = await Hive.openBox("db0");
    var s = (box.get("data") as List?);
    if (s == null)
      return List.empty();
    else
      return s.cast<Character>();
  }

  void save({required List<Character> characters}) async {
    if (characters.isNotEmpty) {
      var box = await Hive.openBox("db0");
      await box.put("data", characters);
    }
  }
}
