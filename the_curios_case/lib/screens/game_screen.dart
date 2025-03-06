import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_curios_case/providers/game_provider.dart';
import 'package:the_curios_case/models/location.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    Location location = gameProvider.locations[gameProvider.currentLocation]!;

    return Scaffold(
      appBar: AppBar(title: Text(location.name)),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              location.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          // Description & Choices
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Text(
                  location.description,
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Column(
                  children: location.choices.map((choice) {
                    return ElevatedButton(
                      onPressed: () => gameProvider.moveTo(choice.nextLocation),
                      child: Text(choice.text),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // Clue Animation
          if (location.clue != null && (location.clue!.imagePath ?? '').isNotEmpty)
            Positioned(
              bottom: 200,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  gameProvider.discoverClue(); // ✅ Fix: Removed argument
                },
                child: AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 2),
                  child: Image.asset(location.clue!.imagePath ?? '', width: 100),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
