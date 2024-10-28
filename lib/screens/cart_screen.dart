import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFF8E301E),
      ),
      backgroundColor: Color(0xFFFFF9E7),
      body: cart.itemCount == 0
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) {
                final cartItem = cart.items.values.toList()[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(cartItem.title),
                    subtitle: Text('Price: \$${cartItem.price}'),
                    trailing: Text('Qty: ${cartItem.quantity}'),
                  ),
                );
              },
            ),
    );
  }
}
