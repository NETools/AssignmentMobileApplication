import 'package:flutter/material.dart';
import 'package:ue1_basisprojekt/db/character.dart';
import 'package:ue1_basisprojekt/db/database.dart';
import 'package:ue1_basisprojekt/networking/api.dart';
import 'package:ue1_basisprojekt/screens/character_detail_screen.dart';

class CharactersListScreen extends StatefulWidget {
  @override
  _CharactersListScreenState createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  List<Character>? characters;

  @override
  void initState() {
    // first the characters are loaded from the database and displayed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      () async {
        characters = await Database().storedCharacters;
        // then the characters are loaded from the API and displayed as soon as they are there
        API().fetchRemoteGoTCharacters().then((characters) {
          setState(() {
            if (this.characters!.length < 100) {
              this.characters = characters;
              Database().save(characters: characters);
            } else
              print("LOAD CACHED!!!!");
          });
        });
      }();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game of Thrones Characters!'),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) => _buildCharacterListTile(index),
          separatorBuilder: (_, __) => Divider(),
          itemCount: characters?.length ?? 0,
        ),
      ),
    );
  }

  Widget _buildCharacterListTile(int index) {
    final Character character = characters![index];
    return ListTile(
      title: Text(
        '${index + 1}. ${character.name}',
        style: TextStyle(fontSize: 17),
      ),
      trailing: Icon(Icons.arrow_forward_ios_outlined),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CharacterDetailScreen(character: character)));
      },
    );
  }
}
