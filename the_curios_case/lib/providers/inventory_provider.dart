import 'package:flutter/material.dart';
import '../models/inventory.dart';

class InventoryProvider extends ChangeNotifier {
  List<InventoryItem> _items = [];

  List<InventoryItem> get items => _items;

  void addItem(String name) {
    _items.add(InventoryItem(name: name));
    notifyListeners();
  }
}
