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
                        })),
                Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(24),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Price",
                                style: TextStyle(color: Colors.green[100]),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$' + value.calculateTotal(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),

                          //pay now button
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.green.shade100),
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(12),
                              child: Row(
                                children: const [
                                  Text(
                                    "Pay Now",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ))
              ],
            );
          },
        ));
  }
}
