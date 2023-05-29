import 'package:filter101/constants/colour.dart';
import 'package:filter101/constants/text_style.dart';
import 'package:filter101/features/login/presentation/page/login_screen.dart';
import 'package:filter101/network/secure_storage.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final SecureStorage secureStorage = SecureStorage();

  Future<void> _logout(BuildContext context) async {
    // Remove user credentials from secure storage
    await secureStorage.deleteCredentials();

    // Navigate to the login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colour.hunterGreen,
        centerTitle: true,
        leading: SizedBox(),
        title: Text(
          'Profile',
          style: TextStyles.heading(
            color: Colour.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to your profile!',
              style: TextStyles.subheading(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                primary: Colour.cordovan,
              ),
              child: Text(
                'Logout',
                style: TextStyles.heading(
                  color: Colour.white,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
