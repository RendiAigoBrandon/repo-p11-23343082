import 'package:flutter/material.dart';
import 'package:repo_p11_23343082/domain/entities/product_entity.dart';
import 'package:repo_p11_23343082/domain/usecases/get_products_usecase.dart';
import 'package:repo_p11_23343082/presentation/widgets/product_card.dart';

class ProductPage extends StatefulWidget {
  final GetProductsUseCase getProductsUseCase;

  const ProductPage({super.key, required this.getProductsUseCase});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<List<ProductEntity>> _productsFuture;

  @override
  void initState() {
    super.initState();
    // Memanggil UseCase untuk mendapatkan data
    _productsFuture = widget.getProductsUseCase.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: FutureBuilder<List<ProductEntity>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada produk yang tersedia.'));
          }

          final products = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                _productsFuture = widget.getProductsUseCase.execute();
              });
            },
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
