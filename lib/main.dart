import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ue1_basisprojekt/db/character.dart';
import 'package:ue1_basisprojekt/screens/characters_list_screen.dart';

void main() {
  Hive.registerAdapter(CharacterAdapter());
  runApp(
    MaterialApp(
      title: 'GoT Characters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CharactersListScreen(),
    ),
  );
}
