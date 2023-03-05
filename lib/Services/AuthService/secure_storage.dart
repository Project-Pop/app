// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const String phone = 'phone';
  static const String userId = 'userId';

  static const String idToken = 'idToken';
  static const String refreshToken = 'refreshToken';
  static const String accessToken = 'accessToken';

  static const _storage = FlutterSecureStorage();

  Future writeSecureData(String key, String value) async {
    final writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future getAttribute(String key) async {
    final readData = await _storage.read(key: key);
    return readData;
  }

  Future<String> getPhoneNumber() async {
    final phone = await getAttribute(SecureStorage.phone);
    return phone;
  }

  Future setPhoneNumber(String val) async {
    final phone = await writeSecureData(SecureStorage.phone, val);
    return phone;
  }

  Future<String> getUserId() async {
    final userId = await getAttribute(SecureStorage.userId);
    return userId;
  }

  Future setUserId(String val) async {
    final userId = await writeSecureData(SecureStorage.userId, val);
    return userId;
  }

  Future<String>? getIdToken() async {
    final idToken = await getAttribute(SecureStorage.idToken);
    return idToken;
  }

  Future setIdToken(String val) async {
    final idToken = await writeSecureData(SecureStorage.idToken, val);
    return idToken;
  }

  Future<String>? getAccessToken() async {
    final accessToken = await getAttribute(SecureStorage.accessToken);
    return accessToken;
  }

  Future setAccessToken(String val) async {
    final accessToken = await writeSecureData(SecureStorage.accessToken, val);
    return accessToken;
  }

  Future<String>? getRefreshToken() async {
    final refreshToken = await getAttribute(SecureStorage.refreshToken);
    return refreshToken;
  }

  Future setRefreshToken(String val) async {
    final refreshToken = await writeSecureData(SecureStorage.refreshToken, val);
    return refreshToken;
  }

  Future logout() async {
    await _storage.deleteAll();
  }
}
