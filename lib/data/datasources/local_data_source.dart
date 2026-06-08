import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalDataSource {
  /// Save data locally
  Future<void> saveData(String key, String value);

  /// Retrieve data from local storage
  Future<String?> getData(String key);

  /// Delete data from local storage
  Future<void> deleteData(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  final FlutterSecureStorage secureStorage;

  LocalDataSourceImpl({required this.secureStorage});

  @override
  Future<void> saveData(String key, String value) async {
    try {
      await secureStorage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getData(String key) async {
    try {
      return await secureStorage.read(key: key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteData(String key) async {
    try {
      await secureStorage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }
}
