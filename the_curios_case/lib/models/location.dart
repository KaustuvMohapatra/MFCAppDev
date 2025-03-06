import 'choice.dart';
import 'clue.dart';

class Location {
  final String name;
  final String description;
  final String imagePath;
  final List<Choice> choices;
  final Clue? clue;

  Location({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.choices,
    this.clue,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      description: json['description'],
      imagePath: json['imagePath'] ?? "",
      choices: (json['choices'] as List<dynamic>)
          .map((choice) => Choice.fromJson(choice as Map<String, dynamic>))
          .toList(),
      clue: json['clue'] != null ? Clue.fromJson(json['clue'] as Map<String, dynamic>) : null,
    );
  }
}
