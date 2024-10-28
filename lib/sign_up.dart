import 'package:flutter/material.dart';
import 'log_in_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign-up successful!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  String? _validate(String? value, {bool isEmail = false, bool isPassword = false}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a ${isEmail ? 'valid email' : isPassword ? 'password' : 'username'}';
    }
    if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    if (isPassword && value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!isPassword && value.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFC0C0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Color(0xFFF3FDE9)),
                  ),
                  const SizedBox(height: 20),
                  _buildSignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE6E6),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Sign Up', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 15),
          _buildTextField(Icons.person, 'Username', _usernameController, false),
          const SizedBox(height: 10),
          _buildTextField(Icons.email, 'Email', _emailController, true),
          const SizedBox(height: 10),
          _buildTextField(Icons.lock, 'Password', _passwordController, false, isPassword: true),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _signUp,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC0C0),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              side: const BorderSide(color: Color(0xFFF8E0C8)),
            ),
            child: const Text('Sign Up', style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(height: 30),
          const Text('Already have an account?', style: TextStyle(color: Color(0xFFA9E08F))),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text(
              'Log in',
              style: TextStyle(color: Color(0xFFFFC0C0), decoration: TextDecoration.underline, decorationColor: Color(0xFFA9E08F)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(IconData icon, String label, TextEditingController controller, bool isEmail, {bool isPassword = false}) {
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
      validator: (value) => _validate(value, isEmail: isEmail, isPassword: isPassword),
    );
  }
}
