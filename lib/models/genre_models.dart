// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GenreModels {
  final int id;
  final String name;

  GenreModels({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory GenreModels.fromMap(Map<String, dynamic> map) {
    return GenreModels(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreModels.fromJson(String source) =>
      GenreModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
