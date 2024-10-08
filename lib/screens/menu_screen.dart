import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import 'cart_screen.dart';

class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'id': 'f1', 'title': 'Hotdog', 'price': 50.0, 'image': 'assets/images/1.png'},
    {'id': 'f2', 'title': 'Chicken Nuggets', 'price': 55.0, 'image': 'assets/images/2.png'},
    {'id': 'f3', 'title': 'Pizza', 'price': 45.0, 'image': 'assets/images/3.png'},
    {'id': 'f4', 'title': 'Burger', 'price': 50, 'image': 'assets/images/4.png'},
    {'id': 'f5', 'title': 'Fries', 'price': 50, 'image': 'assets/images/5.png'},
    {'id': 'f6', 'title': 'Orange Juice', 'price': 25, 'image': 'assets/images/6.png'},
    {'id': 'f7', 'title': 'Raspberry Juice', 'price': 25, 'image': 'assets/images/7.png'},
    {'id': 'f8', 'title': 'Cocktail', 'price': 25, 'image': 'assets/images/8.png'},
  ];

  final double imageWidth;
  final double imageHeight;
  final double borderRadius;

  MenuScreen({
    this.imageWidth = 300,
    this.imageHeight = 300,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
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
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xFFFFF9E7),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: imageWidth,
                    height: imageHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      image: DecorationImage(
                        image: AssetImage(menuItems[index]['image']),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    menuItems[index]['title'],
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Text(
                  '\$${menuItems[index]['price']}',
                  style: TextStyle(color: Colors.black, fontSize: 15),
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
                    backgroundColor: Color(0xFFFFBF00),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 15),
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
