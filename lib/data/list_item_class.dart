import 'package:flutter/foundation.dart';

class ListItem {
  final String name, quantity, weight;

  ListItem({
    required this.name,
    required this.quantity,
    required this.weight
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'weight': weight
    };
  }
}

List<ListItem> products = [];