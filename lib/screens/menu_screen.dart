import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import 'cart_screen.dart'; // Import CartScreen

class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'id': 'p1', 'title': 'Pizza', 'price': 10.0, 'image': 'assets/images/pizza.jpeg'},
    {'id': 'p1', 'title': 'Pizza', 'price': 10.0, 'image': 'assets/images/pizza.jpeg'},
    {'id': 'p1', 'title': 'Pizza', 'price': 10.0, 'image': 'assets/images/pizza.jpeg'},
    {'id': 'p1', 'title': 'Pizza', 'price': 10.0, 'image': 'assets/images/pizza.jpeg'},
    {'id': 'b1', 'title': 'Burger', 'price': 8.0, 'image': 'assets/images/burger.png'},
    {'id': 's1', 'title': 'Sushi', 'price': 12.0, 'image': 'assets/images/sushi.png'},
    // Add more items here with corresponding image paths...
  ];

  final double imageWidth; // Image width
  final double imageHeight; // Image height
  final double borderRadius; // Border radius for images

  // Constructor to receive image dimensions and radius
  MenuScreen({
    this.imageWidth = 250, // Default width
    this.imageHeight = 180, // Default height
    this.borderRadius = 20, // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(color: Colors.white, fontSize: 12), // Set menu title text color to white and font size 12
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Set arrow icon color to white
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white), // Set cart icon color to white
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0), // Padding around the GridView
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Three items per row
          crossAxisSpacing: 8.0, // Horizontal spacing between items
          mainAxisSpacing: 8.0, // Vertical spacing between items
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xFFFFE5E5), // Soft pink
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0), // Padding around the image container
                  child: Container(
                    width: imageWidth, // Set width of image container from parameter
                    height: imageHeight, // Set height of image container from parameter
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius), // Rounded corners using parameter
                      image: DecorationImage(
                        image: AssetImage(menuItems[index]['image']),
                        fit: BoxFit.contain, // Change to contain to avoid filling the container
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0), // Vertical padding between text and image
                  child: Text(
                    menuItems[index]['title'],
                    style: TextStyle(color: Colors.red, fontSize: 12), // Set menu item title text color to red
                  ),
                ),
                Text(
                  '\$${menuItems[index]['price']}',
                  style: TextStyle(color: Colors.white, fontSize: 12), // Set subtitle (price) color to white
                ),
                ElevatedButton(
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
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 12), // Set button text font size to 12
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
