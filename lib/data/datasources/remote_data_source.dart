import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  /// Fetch data from remote API
  Future<dynamic> fetchData();

  /// Post data to remote API
  Future<dynamic> postData(dynamic data);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<dynamic> fetchData() async {
    try {
      final response = await dio.get('/api/data');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> postData(dynamic data) async {
    try {
      final response = await dio.post('/api/data', data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
