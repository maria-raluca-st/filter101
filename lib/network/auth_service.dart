import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<UserCredential?> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle login errors
      print('Login failed. Error: ${e.message}');
      return null;
    }
  }
}
