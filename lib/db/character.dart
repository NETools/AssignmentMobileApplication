import 'package:hive/hive.dart';
part 'character.g.dart';

@HiveType(typeId: 1)
class Character extends HiveObject {
  Character({
    required this.name,
    required this.gender,
    required this.aliases,
  });

  @HiveField(0)
  String name;
  @HiveField(1)
  String gender;
  @HiveField(2)
  List<String> aliases;

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        name: json['name'],
        gender: json['gender'],
        aliases: (json['aliases'] as List).cast<String>());
  }
}
