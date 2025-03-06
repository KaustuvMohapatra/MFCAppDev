import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Game State Management
class GameState extends ChangeNotifier {
  List<String> inventory = [];
  String currentLocation = "Library"; // Starting location

  void addToInventory(String item) {
    if (!inventory.contains(item)) {
      inventory.add(item);
      notifyListeners();
    }
  }

  void changeLocation(String newLocation) {
    currentLocation = newLocation;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Curious Case of the Lost Journal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mystery Adventure"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          const Expanded(child: GameStory()),
          const Divider(),
          const InventoryWidget(),
        ],
      ),
    );
  }
}

class GameStory extends StatelessWidget {
  const GameStory({super.key});

  @override
  Widget build(BuildContext context) {
    String location = context.watch<GameState>().currentLocation;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You are in the $location.",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          if (location == "Library") ...[
            const Text("You see an old dusty journal on a table."),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<GameState>().addToInventory("Lost Journal");
              },
              child: const Text("Pick up the journal"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<GameState>().changeLocation("Secret Room");
              },
              child: const Text("Explore the Secret Room"),
            ),
          ] else if (location == "Secret Room") ...[
            const Text("You find a locked box with a keyhole."),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (context.read<GameState>().inventory.contains("Key")) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("You unlocked the box!")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("You need a key to open it.")),
                  );
                }
              },
              child: const Text("Try to open the box"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<GameState>().changeLocation("Library");
              },
              child: const Text("Go back to the Library"),
            ),
          ]
        ],
      ),
    );
  }
}

class InventoryWidget extends StatelessWidget {
  const InventoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> inventory = context.watch<GameState>().inventory;

    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Inventory:", style: TextStyle(fontWeight: FontWeight.bold)),
          Wrap(
            children: inventory.map((item) => Chip(label: Text(item))).toList(),
          ),
        ],
      ),
    );
  }
}
