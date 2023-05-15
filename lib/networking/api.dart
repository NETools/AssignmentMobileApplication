// The class is responsible to load the GoT characters from the GoTAPI (on https://anapioficeandfire.com/)
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ue1_basisprojekt/db/character.dart';
import 'package:ue1_basisprojekt/db/books.dart';

class API {
  // Note: the documentation for the API can be found here: https://anapioficeandfire.com/Documentation
  final String _charactersRoute =
      "https://anapioficeandfire.com/api/characters";

  Future<Character> fetchCharacter(String url) {
    return Future(() async {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        return Character.fromJson(jsonDecode(response.body));
      } else
        return Character(name: "", gender: "", aliases: []);
    });
  }

  bool isValidCharacter(Character character) {
    return character.aliases.length > 0 &&
        character.aliases[0].toString().isNotEmpty &&
        character.gender!.isNotEmpty &&
        character.aliases.isNotEmpty;
  }

  // Loads the list of GoT characters
  Future<List<Character>> fetchRemoteGoTCharacters() async {
    return Future(() async {
      List<Character> characters = [];

      var url = Uri.parse("https://anapioficeandfire.com/api/books/1");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var book = Book.fromJson(jsonDecode(response.body));
        List<Future<Character>> characterList = [];
        for (String c in book.characters) {
          characterList.add(fetchCharacter(c));
        }

        characterList.forEach((element) {
          element.whenComplete(() async {
            var character = await element;
            if (isValidCharacter(character) && characters.length < 100)
              characters.add(character);
          });
        });

        await Future.wait(characterList);
      }

      return characters;
    });
  }
}
