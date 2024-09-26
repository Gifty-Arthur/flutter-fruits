import "package:flutter/material.dart";

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    //[iteName]
    ["Pear", "4.00", "lib/images/pear.png", Colors.green],
    ["Apple", "4.00", "lib/images/apple.png", Colors.brown],
    ["Banana", "4.00", "lib/images/banana.png", Colors.yellow],
    ["Orange", "4.00", "lib/images/orange.png", Colors.blue],
  ];

  //list of cart items
  final List _cartItems = [];

  get shopItems => _shopItems;
  get cartItem => _cartItems;
  //add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculation
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
