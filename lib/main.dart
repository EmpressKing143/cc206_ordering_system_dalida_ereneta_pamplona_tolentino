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
          primaryColor: Color(0xFFA8DF8E), // Soft green
          scaffoldBackgroundColor: Color(0xFFF3FDE8), // Very light green/cream
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFA8DF8E), // Soft green
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
