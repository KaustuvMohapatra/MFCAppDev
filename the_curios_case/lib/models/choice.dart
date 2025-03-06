class Choice {
  final String text;
  final String nextLocation;

  Choice({required this.text, required this.nextLocation});

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      text: json['text'],
      nextLocation: json['nextLocation'],
    );
  }
}
