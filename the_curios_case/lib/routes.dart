import 'package:flutter/material.dart';
import 'package:the_curios_case/screens/game_screen.dart';
import 'package:the_curios_case/screens/inventory_screen.dart';
import 'package:the_curios_case/screens/settings_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => GameScreen(),
    '/inventory': (context) => InventoryScreen(),
    '/settings': (context) => SettingsScreen(),
  };
}
