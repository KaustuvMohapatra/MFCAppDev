import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.dark();

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    _themeData = (_themeData == ThemeData.dark()) ? ThemeData.light() : ThemeData.dark();
    notifyListeners();
  }
}
