import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static Future<dynamic> read(dynamic key) async {
    final storage = FlutterSecureStorage();
    String value = await storage.read(key: key);
    return value;
  }

  static Future<void> write(dynamic key, dynamic value) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }

  
}
