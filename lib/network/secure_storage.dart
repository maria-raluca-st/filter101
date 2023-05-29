// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SecureStorage {
//   final FlutterSecureStorage _storage = FlutterSecureStorage();
//   static const _keyEmail = 'email';
//   static const _keyPassword = 'password';

//   Future<void> saveCredentials(String email, String password) async {
//     await _storage.write(key: _keyEmail, value: email);
//     await _storage.write(key: _keyPassword, value: password);
//   }

//   Future<String?> getEmail() async {
//     return await _storage.read(key: _keyEmail);
//   }

//   Future<String?> getPassword() async {
//     return await _storage.read(key: _keyPassword);
//   }

//   Future<void> deleteCredentials() async {
//     await _storage.delete(key: _keyEmail);
//     await _storage.delete(key: _keyPassword);
//   }
// }

// --------------------------------------------------------------------------------------------
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
}
