import 'package:flutter/material.dart';
import 'package:fruit/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Cart")),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: value.cartItem.length,
                        padding: EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  leading: Image.asset(
                                    value.cartItem[index][2],
                                    height: 36,
                                  ),
                                  title: Text(value.cartItem[index][0]),
                                  subtitle:
                                      Text('\$' + value.cartItem[index][1]),
                                  trailing: IconButton(
                                    icon: Icon(Icons.cancel),
                                    onPressed: () => Provider.of<CartModel>(
                                            context,
                                            listen: false)
                                        .removeItemFromCart(index),
                                  ),
                                )),
                          );
                        }))
              ],
            );
          },
        ));
  }
}
