abstract class Repository {
  /// Get data
  Future<dynamic> getData();

  /// Save data locally
  Future<void> saveDataLocally(String key, String value);

  /// Get data from local storage
  Future<String?> getLocalData(String key);
}
