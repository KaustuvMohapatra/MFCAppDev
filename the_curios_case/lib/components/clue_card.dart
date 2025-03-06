import 'package:flutter/material.dart';

class ClueCard extends StatelessWidget {
  final String clueText;

  const ClueCard({super.key, required this.clueText});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(clueText),
      ),
    );
  }
}
