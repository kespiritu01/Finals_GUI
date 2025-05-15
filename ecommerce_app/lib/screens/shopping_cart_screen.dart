import 'package:flutter/material.dart';
import '../models/cart_item.dart'; 
import '../models/product.dart';
import 'checkout_screen.dart';

class ShoppingCartScreen extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(int, int) onUpdateQuantity;
  final Function(int) onRemoveItem;

  const ShoppingCartScreen({
    Key? key,
    required this.cartItems,
    required this.onUpdateQuantity,
    required this.onRemoveItem,
  }) : super(key: key);

  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: const Color.fromARGB(255, 89, 134, 149),
        foregroundColor: Colors.white,
      ),
      body: cartItems.isEmpty
          ? Center(child: 
          Text('Your cart is empty.')
          )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(item.product.name),
                          subtitle: Text("₱${item.product.price.toStringAsFixed(2)} x ${item.quantity}"),
                          trailing: Text("₱${(item.product.price * item.quantity).toStringAsFixed(2)}"),
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  if (item.quantity > 1) {
                                    onUpdateQuantity(index, item.quantity - 1);
                                  } else {
                                    onRemoveItem(index);
                                  }
                                },
                              ),
                              Text(item.quantity.toString(), style: TextStyle(fontSize: 16)),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  onUpdateQuantity(index, item.quantity + 1);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Subtotal: ₱${subtotal.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(cartItems: cartItems),
                            ),
                          );
                        },
                        child: Text('Proceed to Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
