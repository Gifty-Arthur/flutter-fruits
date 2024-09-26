import 'package:flutter/material.dart';
import 'package:fruit/components/grocery_item.dart';
import 'package:fruit/model/cart_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),

          //good morning
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Good morning "),
          ),
          const SizedBox(
            height: 4,
          ),
          //let order fresh items

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Let's order fresh items for you",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 24),
          //divider

          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              thickness: 4,
            ),
          ),

          const SizedBox(height: 24),

          //fresh item + grid
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Fresh Items",
              style: TextStyle(fontSize: 16),
            ),
          ),

          Expanded(child: Consumer<CartModel>(builder: (context, value, child) {
            return GridView.builder(
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GroceryItems(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3]);
                });
          }))
        ],
      ),
    ));
  }
}
