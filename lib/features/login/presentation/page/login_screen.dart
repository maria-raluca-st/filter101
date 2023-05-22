// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../../../../coordinator.dart';
// import '../../../../routes.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   GoogleSignInAccount? _googleSignInAccount;

//   Future<void> _login() async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
//       // Login successful, navigate to another screen
//       // For example, Navigator.pushReplacement() to go to a home screen
//       print('Login successful!');
//       Coordinator.of(context).push(RouteEntity.onboardingScreen());
//     } on FirebaseAuthException catch (e) {
//       // Handle login errors
//       print('Login failed. Error: ${e.message}');
//     }
//   }

//   Future<void> _loginWithGoogle() async {
//     try {
//       final GoogleSignIn googleSignIn = GoogleSignIn();
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//       if (googleUser != null) {
//         _googleSignInAccount = googleUser;
//         final GoogleSignInAuthentication googleAuth =
//             await googleUser.authentication;

//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         final UserCredential userCredential =
//             await _auth.signInWithCredential(credential);
//         // Login with Google successful, navigate to another screen
//         // For example, Navigator.pushReplacement() to go to a home screen
//         Coordinator.of(context).push(RouteEntity.onboardingScreen());
//         print('Log in w google succesful!');
//       }
//     } catch (e) {
//       // Handle login errors
//       print('Login with Google failed. Error: $e');
//     }
//   }

//   void _navigateToSignUp() {
//     // Navigate to the signup screen
//     // For example, Navigator.push() to go to a signup screen
//     Coordinator.of(context).push(RouteEntity.registerScreen());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _login,
//               child: const Text('Login'),
//             ),
//             const SizedBox(height: 8.0),
//             ElevatedButton(
//               style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.green)),
//               onPressed: _loginWithGoogle,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(
//                     // AssetPaths.googleIcon,
//                     'assets/png/google_logo.png',
//                     height: 24.0,
//                   ),
//                   const SizedBox(width: 8.0),
//                   const Text('Login with Google'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             TextButton(
//               onPressed: _navigateToSignUp,
//               child: const Text('Don\'t have an account? Sign up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ======================================

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../constants/colour.dart';
import '../../../../coordinator.dart';
import '../../../../routes.dart';
import '../../../../constants/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInAccount? _googleSignInAccount;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Login successful, navigate to another screen
      // For example, Navigator.pushReplacement() to go to a home screen
      print('Login successful!');
      Coordinator.of(context).push(RouteEntity.onboardingScreen());
    } on FirebaseAuthException catch (e) {
      // Handle login errors
      print('Login failed. Error: ${e.message}');
    }
  }

  Future<void> _loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        _googleSignInAccount = googleUser;
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        // Login with Google successful, navigate to another screen
        // For example, Navigator.pushReplacement() to go to a home screen
        Coordinator.of(context).push(RouteEntity.onboardingScreen());
        print('Log in w google succesful!');
      }
    } catch (e) {
      // Handle login errors
      print('Login with Google failed. Error: $e');
    }
  }

  void _navigateToSignUp() {
    // Navigate to the signup screen
    // For example, Navigator.push() to go to a signup screen
    Coordinator.of(context).push(RouteEntity.registerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.ashGray,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 64.0),
                child: Center(
                  child: Text(
                    'Login',
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
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    primary: Colour.cordovan,
                  ),
                  child: Text(
                    'Login',
                    style:
                        TextStyles.heading(color: Colour.white, fontSize: 22),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: double.infinity,
                height: 48.0,
                child: ElevatedButton(
                  onPressed: _loginWithGoogle,
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
                        'Login with Google',
                        style: TextStyles.heading(
                            color: Colour.white, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
              TextButton(
                onPressed: _navigateToSignUp,
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyles.subheading(
                      color: Colour.hunterGreen, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
