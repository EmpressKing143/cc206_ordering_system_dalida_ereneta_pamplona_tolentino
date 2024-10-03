import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'Food Ordering System',
        theme: ThemeData(
          primaryColor: Color(0xFF557C56), // Soft green (557C56)
          scaffoldBackgroundColor: Color(0xFFFFE5E5), // Changed to light pink (FFE5E5)
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF557C56), // Soft green (557C56)
          ),
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false, // Disable debug banner
      ),
    );
  }
}
