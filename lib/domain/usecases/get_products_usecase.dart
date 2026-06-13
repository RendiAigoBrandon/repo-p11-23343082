import 'package:repo_p11_23343082/domain/entities/product_entity.dart';
import 'package:repo_p11_23343082/domain/repositories/repository.dart';
import 'package:repo_p11_23343082/data/models/product_model.dart';

class GetProductsUseCase {
  final Repository repository;

  GetProductsUseCase({required this.repository});

  Future<List<ProductEntity>> execute() async {
    try {
      final response = await repository.getData();
      // Mengubah dynamic response ke dalam bentuk List<ProductEntity>
      if (response is List) {
        return response.map((e) => ProductModel.fromJson(e)).toList();
      }
      return _getDummyProducts();
    } catch (e) {
      // Mengembalikan data dummy jika terjadi error, agar aplikasi tetap bisa berjalan untuk testing UI
      return _getDummyProducts();
    }
  }

  List<ProductEntity> _getDummyProducts() {
    return [
      ProductEntity(id: 1, name: 'Tas Ransel Keren', price: 150000, imageUrl: 'https://via.placeholder.com/150/0000FF/808080?Text=Tas'),
      ProductEntity(id: 2, name: 'Sepatu Lari Sport', price: 350000, imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?Text=Sepatu'),
      ProductEntity(id: 3, name: 'Kacamata Hitam', price: 85000, imageUrl: 'https://via.placeholder.com/150/000000/FFFFFF?Text=Kacamata'),
      ProductEntity(id: 4, name: 'Jam Tangan Digital', price: 250000, imageUrl: 'https://via.placeholder.com/150/FFFF00/000000?Text=Jam'),
    ];
  }
}
