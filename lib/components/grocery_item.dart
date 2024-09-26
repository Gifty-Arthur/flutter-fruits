import 'package:flutter/material.dart';

class GroceryItems extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;

  const GroceryItems({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(color: color[100]),
        child: Column(children: [
          //image
          Image.asset(
            imagePath,
            height: 64,
          )
        ]),
      ),
    );
  }
}
