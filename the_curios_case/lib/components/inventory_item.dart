import 'package:flutter/material.dart';

class InventoryItem extends StatelessWidget {
  final String itemName;

  const InventoryItem({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(itemName),
    );
  }
}
