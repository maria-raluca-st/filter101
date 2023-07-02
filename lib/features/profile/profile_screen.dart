import 'dart:io';

import 'package:filter101/constants/colour.dart';
import 'package:filter101/constants/text_style.dart';
import 'package:filter101/features/login/presentation/page/login_screen.dart';
import 'package:filter101/network/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SecureStorage secureStorage = SecureStorage();
  String? _userEmail;
  File? _profilePicture;
  String? _profilePictureUrl;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    _loadProfilePicture();
  }

  Future<void> _loadProfileData() async {
    final email = await secureStorage.getEmail();
    setState(() {
      _userEmail = email;
    });
  }

  Future<void> _loadProfilePicture() async {
    final storage = SecureStorage();
    final email = await storage.getEmail();

    if (email != null) {
      final imageUrl = await storage.getProfilePictureUrl(email);

      if (imageUrl != null && mounted) {
        setState(() {
          _profilePictureUrl = imageUrl;
        });
      } else {
        // Image URL retrieval failed
        // Handle the error
      }
    } else {
      // Email is not available
      // Handle the error
    }
  }

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

  Future<void> _changeProfilePicture() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _profilePicture = File(pickedImage.path);
      });

      final storage = SecureStorage();
      final email = await storage.getEmail();

      if (email != null) {
        var imageUrl =
            await storage.uploadProfilePicture(email, pickedImage.path);

        if (imageUrl != null) {
          // Profile picture uploaded successfully
          // You can store the imageUrl in Firebase Firestore or wherever you want
          imageUrl = _profilePictureUrl;
        } else {
          // Profile picture upload failed
          // Handle the error
        }
      } else {
        // Email is not available
        // Handle the error
      }
    }
  }

  Future<void> _changeEmailAddress(BuildContext context) async {
    final secureStorage = SecureStorage();
    final currentEmail = await secureStorage.getEmail();

    final TextEditingController emailController =
        TextEditingController(text: currentEmail);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Change Email Address',
            style: TextStyles.heading(),
          ),
          content: TextField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: 'New Email Address', labelStyle: TextStyles.body()),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel',
                  style: TextStyles.subheading(color: Colour.atomicTangerine)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save',
                  style: TextStyles.subheading(color: Colour.hunterGreen)),
              onPressed: () async {
                final newEmail = emailController.text;

                try {
                  await secureStorage.changeEmailAddress(newEmail);
                  Navigator.of(context).pop();
                  // Show success message or perform any additional actions
                } catch (e) {
                  // Handle error, show error message, or perform any additional actions
                  print('Error changing email address: $e');
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _changePassword(BuildContext context) async {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Change Password',
            style: TextStyles.heading(),
          ),
          content: Column(
            children: [
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'New Password', labelStyle: TextStyles.body()),
              ),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Confirm New Password',
                    labelStyle: TextStyles.body()),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyles.subheading(color: Colour.atomicTangerine),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save',
                  style: TextStyles.subheading(color: Colour.hunterGreen)),
              onPressed: () async {
                final newPassword = passwordController.text;
                final confirmPassword = confirmPasswordController.text;

                if (newPassword == confirmPassword) {
                  try {
                    await secureStorage.changePassword(newPassword);
                    Navigator.of(context).pop();
                    // Show success message or perform any additional actions
                  } catch (e) {
                    // Handle error, show error message, or perform any additional actions
                    print('Error changing password: $e');
                  }
                } else {
                  // Show password mismatch error message
                }
              },
            ),
          ],
        );
      },
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              InkWell(
                onTap: _changeProfilePicture,
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: _profilePicture != null
                      ? FileImage(_profilePicture!) as ImageProvider
                      : _profilePictureUrl != null
                          ? NetworkImage(_profilePictureUrl!) as ImageProvider
                          : AssetImage('assets/png/user_avatar.png'),
                  child: _profilePicture != null || _profilePictureUrl != null
                      ? null
                      : Image(
                          image: AssetImage('assets/png/user_avatar.png'),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 46.0),
              Text(
                _userEmail ?? '',
                style: TextStyles.subheading(fontSize: 18),
              ),
              const SizedBox(height: 32.0),
              ListTile(
                onTap: () => _changeEmailAddress(context),
                title: Text(
                  'Change Email Address',
                  style: TextStyles.heading(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () => _changePassword(context),
                title: Text(
                  'Change Password',
                  style: TextStyles.heading(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () => _logout(context),
                title: Text(
                  'Logout',
                  style: TextStyles.heading(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
