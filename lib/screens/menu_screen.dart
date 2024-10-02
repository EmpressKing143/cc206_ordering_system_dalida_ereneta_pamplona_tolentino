import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import 'cart_screen.dart'; // Import CartScreen

class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'id': 'p1', 'title': 'Pizza', 'price': 10.0, 'image': 'assets/images/pizza.jpeg'},
    {'id': 'b1', 'title': 'Burger', 'price': 8.0, 'image': 'assets/images/burger.png'},
    {'id': 's1', 'title': 'Sushi', 'price': 12.0, 'image': 'assets/images/sushi.png'},
    // Add more items here with corresponding image paths...
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xFFFFE5E5), // Soft pink
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Container(
                width: 60, // Set width of image container
                height: 60, // Set height of image container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  image: DecorationImage(
                    image: AssetImage(menuItems[index]['image']),
                    fit: BoxFit.cover, // Cover to fill the container
                  ),
                ),
              ),
              title: Text(menuItems[index]['title']),
              subtitle: Text('\$${menuItems[index]['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  cart.addItem(
                    menuItems[index]['id'],
                    menuItems[index]['title'],
                    menuItems[index]['price'],
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${menuItems[index]['title']} added to cart!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA8DF8E), // Soft green
                ),
                child: Text('Add'),
              ),
            ),
          );
        },
      ),
    );
  }
}
