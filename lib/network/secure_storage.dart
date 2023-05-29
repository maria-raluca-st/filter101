import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';

  Future<void> saveCredentials(String email, String password) async {
    await _storage.write(key: _keyEmail, value: email);
    await _storage.write(key: _keyPassword, value: password);
  }

  Future<String?> getEmail() async {
    return await _storage.read(key: _keyEmail);
  }

  Future<String?> getPassword() async {
    return await _storage.read(key: _keyPassword);
  }

  Future<void> deleteCredentials() async {
    await _storage.delete(key: _keyEmail);
    await _storage.delete(key: _keyPassword);
  }
}
