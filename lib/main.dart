import 'package:flutter/material.dart';
<<<<<<< HEAD
String localVariable = "Local change";
import 'sign_up.dart';
=======
String remoteVariable = "Remote change";
import 'feature/sign_up.dart';
>>>>>>>  origin/cc206_pamplona_ereneta

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignUpScreen(),
    );
  }
}
