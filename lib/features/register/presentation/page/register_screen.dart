import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../constants/colour.dart';
import '../../../../coordinator.dart';
import '../../../../routes.dart';
import '../../../../constants/text_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
      backgroundColor: Colour.ashGray,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 64.0),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyles.heading(
                          color: Colour.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 66.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colour.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        contentPadding: const EdgeInsets.all(16.0),
                        border: InputBorder.none,
                        labelStyle: TextStyles.body(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colour.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        contentPadding: const EdgeInsets.all(16.0),
                        border: InputBorder.none,
                        labelStyle: TextStyles.body(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    height: 48.0,
                    child: ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                        primary: Colour.cordovan,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyles.heading(
                            color: Colour.white, fontSize: 22),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    height: 48.0,
                    child: ElevatedButton(
                      onPressed: _signUpWithGoogle,
                      style: ElevatedButton.styleFrom(
                        primary: Colour.atomicTangerine,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/png/google_logo.png',
                            height: 24.0,
                          ),
                          const SizedBox(width: 14.0),
                          Text(
                            'Sign Up with Google',
                            style: TextStyles.heading(
                                color: Colour.white, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 80.0),
                  TextButton(
                    onPressed: _navigateToLogin,
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyles.subheading(
                          color: Colour.hunterGreen,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
