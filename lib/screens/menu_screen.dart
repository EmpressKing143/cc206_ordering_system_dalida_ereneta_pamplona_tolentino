import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import 'cart_screen.dart';

class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'id': 'f1', 'title': 'Hotdog', 'price': 50.0, 'image': 'assets/images/1.png', 'ingredients': 'Beef, Bun, Ketchup'},
    {'id': 'f2', 'title': 'Chicken Nuggets', 'price': 55.0, 'image': 'assets/images/2.png', 'ingredients': 'Chicken, Bread Crumbs'},
    {'id': 'f3', 'title': 'Pizza', 'price': 45.0, 'image': 'assets/images/3.png', 'ingredients': 'Dough, Cheese, Tomato Sauce'},
    {'id': 'f4', 'title': 'Burger', 'price': 50, 'image': 'assets/images/4.png', 'ingredients': 'Beef, Lettuce, Tomato, Cheese'},
    {'id': 'f5', 'title': 'Fries', 'price': 50, 'image': 'assets/images/5.png', 'ingredients': 'Potatoes, Salt'},
    {'id': 'f6', 'title': 'Orange Juice', 'price': 25, 'image': 'assets/images/6.png', 'ingredients': 'Oranges'},
    {'id': 'f7', 'title': 'Raspberry Juice', 'price': 25, 'image': 'assets/images/7.png', 'ingredients': 'Raspberries, Water'},
    {'id': 'f8', 'title': 'Cocktail', 'price': 25, 'image': 'assets/images/8.png', 'ingredients': 'Various Spirits, Mixers'},
  ];

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
        backgroundColor: Color(0xFF8E301E),
      ),
      backgroundColor: Color(0xFFFFF9E7),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(menuItems[index]['title']),
                    content: Text('Ingredients: ${menuItems[index]['ingredients']}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Card(
              color: Color(0xFFFFF9E7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(menuItems[index]['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Center(
                      child: Text(
                        menuItems[index]['title'],
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '\$${menuItems[index]['price']}',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        cart.addItem(
                          menuItems[index]['id'],
                          menuItems[index]['title'],
                          menuItems[index]['price'],
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${menuItems[index]['title']} added to cart!'),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                cart.removeItem(menuItems[index]['id']);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${menuItems[index]['title']} removed from cart!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                            ),
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
