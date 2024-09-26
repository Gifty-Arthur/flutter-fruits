import "package:flutter/material.dart";

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    //[iteName]
    ["Pear", "4.00", "lib/images/pear.png", Colors.green],
    ["Apple", "4.00", "lib/images/apple.png", Colors.brown],
    ["Banana", "4.00", "lib/images/banana.png", Colors.yellow],
    ["Orange", "4.00", "lib/images/orange.png", Colors.blue],
  ];
  get shopItems => _shopItems;
}
