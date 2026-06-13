import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:repo_p11_23343082/data/datasources/dio_auth_interceptor.dart';
import 'package:repo_p11_23343082/data/datasources/dio_service.dart';
import 'package:repo_p11_23343082/data/datasources/local_data_source.dart';
import 'package:repo_p11_23343082/data/datasources/remote_data_source.dart';
import 'package:repo_p11_23343082/data/repositories/repository_impl.dart';
import 'package:repo_p11_23343082/domain/usecases/get_products_usecase.dart';
import 'package:repo_p11_23343082/presentation/pages/product_page.dart';

void main() {
  // --- Setup Dependency Injection Secara Manual ---
  
  // 1. Storage
  const secureStorage = FlutterSecureStorage();

  // 2. Local Data Source
  final localDataSource = LocalDataSourceImpl(secureStorage: secureStorage);

  // 3. Interceptor (Mengambil token)
  final authInterceptor = DioAuthInterceptor(
    getToken: () => 'dummy_token_123', // Dummy synchronous token
  );

  // 4. Dio Service
  final dioService = DioService(authInterceptor: authInterceptor);

  // 5. Remote Data Source
  final remoteDataSource = RemoteDataSourceImpl(dio: dioService.dio);

  // 6. Repository
  final repository = RepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );

  // 7. UseCase
  final getProductsUseCase = GetProductsUseCase(repository: repository);

  // Run App
  runApp(MyApp(getProductsUseCase: getProductsUseCase));
}

class MyApp extends StatelessWidget {
  final GetProductsUseCase getProductsUseCase;

  const MyApp({super.key, required this.getProductsUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Produk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ProductPage(getProductsUseCase: getProductsUseCase),
    );
  }
}
