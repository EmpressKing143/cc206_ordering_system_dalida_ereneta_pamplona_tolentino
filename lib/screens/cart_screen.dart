import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: cart.itemCount == 0
          ? Center(child: Text('Your cart is empty!'))
          : ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) {
                final cartItem = cart.items.values.toList()[index];
                return ListTile(
                  title: Text(cartItem.title),
                  subtitle: Text('\$${cartItem.price} x ${cartItem.quantity}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      cart.removeItem(cartItem.id);
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$${cart.totalAmount.toStringAsFixed(2)}'),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFBF00),
              ),
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}