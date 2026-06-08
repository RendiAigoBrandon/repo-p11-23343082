import 'package:dio/dio.dart';

class DioAuthInterceptor extends Interceptor {
  final String Function() getToken;

  DioAuthInterceptor({required this.getToken});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = getToken();
    options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // Handle unauthorized - refresh token or logout
    }
    return handler.next(err);
  }
}
