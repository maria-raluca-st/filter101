import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  static const _hateSpeech = 'hateSpeech';
  static const _negativeContent = 'negativeContent';
  static const _humor = 'humor';
  static const _positiveContent = 'positiveContent';
  static const _sarcasmExcluding = 'sarcasmExcluding';
  static const _sarcasmIncluding = 'sarcasmIncluding';

  Future<void> saveCredentials(String email, String password) async {
    await _storage.write(key: _keyEmail, value: email);
    await _storage.write(key: _keyPassword, value: password);
  }

  Future<void> saveBooleanValues(String key, bool value) async {
    await _storage.write(key: key, value: value.toString());
  }

  Future<String?> getEmail() async {
    return await _storage.read(key: _keyEmail);
  }

  Future<String?> getPassword() async {
    return await _storage.read(key: _keyPassword);
  }

  Future<bool?> getBool(String key) async {
    final value = await _storage.read(key: key);
    return value != null ? value.toLowerCase() == 'true' : null;
  }

  Future<void> deleteCredentials() async {
    await _storage.deleteAll();
  }

  Future<Map<String, bool>?> getBoolMap() async {
    final Map<String, bool> boolMap = {};
    bool? value;

    for (var key in [
      _hateSpeech,
      _negativeContent,
      _humor,
      _positiveContent,
      _sarcasmExcluding,
      _sarcasmIncluding
    ]) {
      value = await getBool(key);
      if (value != null) {
        boolMap[key] = value;
      }
    }

    return boolMap;
  }

  Future<String?> uploadProfilePicture(String userId, String imagePath) async {
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('profile_pictures/$userId');

    try {
      final UploadTask uploadTask = storageRef.putFile(File(imagePath));

      final TaskSnapshot taskSnapshot = await uploadTask;

      if (taskSnapshot.state == TaskState.success) {
        final imageUrl = await storageRef.getDownloadURL();
        return imageUrl;
      } else {
        return null;
      }
    } catch (e) {
      print('Error uploading profile picture: $e');
      return null;
    }
  }

  Future<String?> getProfilePictureUrl(String userId) async {
    try {
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('profile_pictures/$userId');

      final imageUrl = await storageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error retrieving profile picture URL: $e');
      return null;
    }
  }

  Future<void> changeEmailAddress(String newEmail) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      await currentUser?.updateEmail(newEmail);
      await _storage.write(key: _keyEmail, value: newEmail);
    } catch (e) {
      print('Error changing email address: $e');
      throw e;
    }
  }

  Future<void> changePassword(String newPassword) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      await currentUser?.updatePassword(newPassword);
      await _storage.write(key: _keyPassword, value: newPassword);
    } catch (e) {
      print('Error changing password: $e');
      throw e;
    }
  }
}
