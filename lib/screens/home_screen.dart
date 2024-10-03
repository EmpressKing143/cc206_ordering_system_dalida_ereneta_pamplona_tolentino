import 'package:flutter/material.dart';
import 'menu_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Ordering System',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the text bold
            color: Colors.white,          // Set the text color to white
          ),
        ),
        centerTitle: true, // Center the title
      ),
      backgroundColor: Color(0xFFFFE5E5), // Light pink background (FFE5E5)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Food Ordering System!',
              style: TextStyle(fontSize: 20, color: const Color.fromARGB(221, 35, 3, 33)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFBFBF), // Light pink button
              ),
              child: Text('View Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
