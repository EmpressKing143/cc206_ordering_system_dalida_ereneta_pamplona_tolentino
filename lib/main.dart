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
          primaryColor: Color(0xFF308833),
          scaffoldBackgroundColor: Color(0xFFE5E5),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF8E301E),
          ),
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
