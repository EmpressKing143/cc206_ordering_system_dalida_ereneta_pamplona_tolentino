import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'log_in_page.dart';
=======
>>>>>>> 9c5ea6f7793b87dfc4faa191d5b7358e2fea7dfc
=======
>>>>>>> 9c5ea6f7793b87dfc4faa191d5b7358e2fea7dfc

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFC0C0), 
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome!', 
                  style: TextStyle(
                    fontSize: 50.0, 
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF3FDE9), 
                  ),
                ),
                const SizedBox(height: 20), 
                Container(
                  width: 300, 
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE6E6), 
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: const Offset(0, 5), 
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Sign Up', 
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, 
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(Icons.person, 'Username'),
                      const SizedBox(height: 10),
                      _buildTextField(Icons.email, 'Email'),
                      const SizedBox(height: 10),
                      _buildTextField(Icons.lock, 'Password', obscureText: true),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
<<<<<<< HEAD
<<<<<<< HEAD
                
=======

>>>>>>> 9c5ea6f7793b87dfc4faa191d5b7358e2fea7dfc
=======

>>>>>>> 9c5ea6f7793b87dfc4faa191d5b7358e2fea7dfc
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC0C0), 
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(color: Color(0xFFF8E0C8)), 
                        ),
                        child: const Text('Sign Up', style: TextStyle(color: Colors.black)), 
                      ),
                      const SizedBox(height: 30), 
                      const Text(
                        'Already have an account? ', 
                        style: TextStyle(color: Color(0xFFA9E08F)), 
                      ),
<<<<<<< HEAD
<<<<<<< HEAD
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Color(0xFFFFC0C0),
                            decoration: TextDecoration.underline, 
                            decorationColor: Color(0xFFA9E08F),
                          ),
=======
=======
>>>>>>> 9c5ea6f7793b87dfc4faa191d5b7358e2fea7dfc
                      const Text(
                        'Log in',
                        style: TextStyle(
                          color: Color(0xFFFFC0C0),
                          decoration: TextDecoration.underline, 
                          decorationColor: Color(0xFFA9E08F),
<<<<<<< HEAD
>>>>>>> 9c5ea6f7793b87dfc4faa191d5b7358e2fea7dfc
=======
>>>>>>> 9c5ea6f7793b87dfc4faa191d5b7358e2fea7dfc
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String label, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      style: TextStyle(color: const Color(0xFFF3FDE9)), 
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFACE894),
        prefixIcon: Icon(icon, color: const Color(0xFFF3FDE9)), 
        labelText: label,
        labelStyle: TextStyle(color: const Color(0xFFF3FDE9)), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: const Color(0xFFF8E0C8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: const Color(0xFFF8E0C8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: const Color(0xFFF8E0C8)), 
        ),
      ),
    );
  }
}
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 9c5ea6f7793b87dfc4faa191d5b7358e2fea7dfc

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log In')),
      body: const Center(
        child: Text('Login Screen'),
      ),
    );
  }
}
<<<<<<< HEAD
>>>>>>> 9c5ea6f7793b87dfc4faa191d5b7358e2fea7dfc
=======
>>>>>>> 9c5ea6f7793b87dfc4faa191d5b7358e2fea7dfc
