import 'package:repo_p11_23343082/data/datasources/local_data_source.dart';
import 'package:repo_p11_23343082/data/datasources/remote_data_source.dart';
import 'package:repo_p11_23343082/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<dynamic> getData() async {
    try {
      // Try to fetch from remote first
      final remoteData = await remoteDataSource.fetchData();
      // Cache it locally
      await localDataSource.saveData('cached_data', remoteData.toString());
      return remoteData;
    } catch (e) {
      // If remote fails, try local
      final localData = await localDataSource.getData('cached_data');
      if (localData != null) {
        return localData;
      }
      rethrow;
    }
  }

  @override
  Future<void> saveDataLocally(String key, String value) async {
    try {
      await localDataSource.saveData(key, value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getLocalData(String key) async {
    try {
      return await localDataSource.getData(key);
    } catch (e) {
      rethrow;
    }
  }
}
