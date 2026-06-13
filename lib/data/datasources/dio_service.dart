import 'package:dio/dio.dart';
import 'package:repo_p11_23343082/data/datasources/dio_auth_interceptor.dart';

class DioService {
  late final Dio _dio;

  DioService({required DioAuthInterceptor authInterceptor}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.example.com', // Base URL dummy sesuai kesepakatan
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Mendaftarkan interceptor untuk autentikasi
    _dio.interceptors.add(authInterceptor);
  }

  Dio get dio => _dio;
}
