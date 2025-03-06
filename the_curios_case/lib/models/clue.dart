class Clue {
  final String description;
  final String? imagePath;

  Clue({required this.description, this.imagePath});

  factory Clue.fromJson(Map<String, dynamic> json) {
    return Clue(
      description: json['description'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'imagePath': imagePath,
    };
  }
}
