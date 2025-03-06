import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/location.dart';
import '../models/clue.dart';
import '../models/choice.dart';

class GameProvider extends ChangeNotifier {
  late String _currentLocation;
  final List<String> _inventory = [];
  final Map<String, Location> _locations = {};
  final AudioPlayer _audioPlayer = AudioPlayer();

  String get currentLocation => _currentLocation;
  List<String> get inventory => _inventory;
  Map<String, Location> get locations => _locations;

  GameProvider() {
    _initializeGame();
  }

  Future<void> _initializeGame() async {
    _currentLocation = "Home";
    _loadLocations();
    _playBackgroundMusic();
    notifyListeners();
  }

  void _loadLocations() {
    _locations.addAll({
      "Home": Location(
        name: "Home",
        description: "Your cozy house.",
        imagePath: "assets/images/home.png",
        choices: [Choice(text: "Enter the Library", nextLocation: "Library")],
      ),
      "Library": Location(
        name: "Library",
        description: "A dark, mysterious library filled with books.",
        imagePath: "assets/images/library.png",
        choices: [],
        clue: Clue(description: "An old torn diary page.", imagePath: "assets/images/clue.png"),
      ),
    });
  }

  void moveTo(String newLocation) {
    if (_locations.containsKey(newLocation)) {
      _currentLocation = newLocation;
      notifyListeners();
    }
  }

  void discoverClue() {
    Location? location = _locations[_currentLocation];
    if (location?.clue != null && !_inventory.contains(location!.clue!.description)) {
      _inventory.add(location.clue!.description);
      _playSoundEffect("assets/audio/clue_found.mp3");
      notifyListeners();
    }
  }

  Future<void> _playBackgroundMusic() async {
    await _audioPlayer.play(AssetSource("assets/audio/background_music.mp3"));
  }

  Future<void> _playSoundEffect(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }
}
