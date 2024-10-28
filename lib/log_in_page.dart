import 'package:flutter/material.dart';
import 'sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFB6B6),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Color(0xFFF3FDE9)),
              ),
              const SizedBox(height: 20),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logging in...')));
    }
  }

  String? _validate(String? value, {bool isPassword = false}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a ${isPassword ? 'password' : 'username'}';
    }
    if (isPassword && value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE6E6),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text('Log In', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(height: 15),
            _buildTextField(Icons.person, 'Username', _usernameController),
            const SizedBox(height: 10),
            _buildTextField(Icons.lock, 'Password', _passwordController, isPassword: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC0C0),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                side: const BorderSide(color: Color(0xFFF8E0C8)),
              ),
              child: const Text('Log In', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 30),
            const Text("Don't have an account?", style: TextStyle(color: Color(0xFFA9E08F))),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
              },
              child: const Text(
                'Sign up',
                style: TextStyle(color: Color(0xFFFFC0C0), decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String label, TextEditingController controller, {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Color(0xFFF3FDE9)),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFACE894),
        prefixIcon: Icon(icon, color: const Color(0xFFF3FDE9)),
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFFF3FDE9)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFF8E0C8)),
        ),
      ),
      validator: (value) => _validate(value, isPassword: isPassword),
    );
  }
}
