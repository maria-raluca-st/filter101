import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../coordinator.dart';
import '../../../../routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signUp() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Registration successful, navigate to another screen
      // For example, Navigator.pushReplacement() to go to a home screen
      Coordinator.of(context).push(RouteEntity.onboardingScreen());
    } on FirebaseAuthException catch (e) {
      // Handle registration errors
      print('Registration failed. Error: ${e.message}');
    }
  }

  Future<void> _signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        // Registration with Google successful, navigate to another screen
        // For example, Navigator.pushReplacement() to go to a home screen
        Coordinator.of(context).push(RouteEntity.onboardingScreen());
      }
    } catch (e) {
      // Handle registration errors
      print('Registration with Google failed. Error: $e');
    }
  }

  void _navigateToLogin() {
    // Navigate to the login screen
    // For example, Navigator.push() to go to the login screen
    Coordinator.of(context).push(RouteEntity.loginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Sign Up'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _signUpWithGoogle,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/png/google_logo.png',
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Text('Sign Up with Google'),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            TextButton(
              onPressed: _navigateToLogin,
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
