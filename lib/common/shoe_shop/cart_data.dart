import 'package:flutter/material.dart';

class CartData extends ChangeNotifier {
  static final CartData instance = CartData._internal();

  CartData._internal();

  final List<Map<String, dynamic>> items = [];

  void addToCart({
    required String name,
    required double price,
    required String image,
    required String size,
  }) {
    final existingIndex = items.indexWhere(
      (item) =>
          item['name'] == name &&
          item['size'] == size,
    );

    if (existingIndex != -1) {
      items[existingIndex]['quantity']++;
    } else {
      items.add({
        'name': name,
        'price': price,
        'image': image,
        'size': size,
        'quantity': 1,
      });
    }

    notifyListeners();
  }

  void increaseQuantity(int index) {
    items[index]['quantity']++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (items[index]['quantity'] > 1) {
      items[index]['quantity']--;
    } else {
      items.removeAt(index);
    }

    notifyListeners();
  }

  void removeItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }

  double get total {
    double result = 0;

    for (final item in items) {
      result +=
          item['price'] * item['quantity'];
    }

    return result;
  }
}