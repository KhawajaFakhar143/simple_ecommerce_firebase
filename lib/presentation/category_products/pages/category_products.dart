import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecommerce_firebase/common/state_managment/product/products_display_provider.dart';
import 'package:simple_ecommerce_firebase/common/widgets/app_bar/app_bar.dart';
import 'package:simple_ecommerce_firebase/common/widgets/product/product_card.dart';
import 'package:simple_ecommerce_firebase/domain/category/entity/category.dart';
import 'package:simple_ecommerce_firebase/domain/product/entities/product.dart';
import 'package:simple_ecommerce_firebase/domain/product/usecases/get_products_by_category_id.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity categoryEntity;

  const CategoryProductsPage({required this.categoryEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsDisplayProvider(useCase: sl<GetProductsByCategoryIdUseCase>())
        ..displayProducts(params: categoryEntity.categoryId),
      child: Scaffold(
        appBar: const BasicAppbar(),
        body: Consumer<ProductsDisplayProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (provider.errorMessage != null) {
              return const Center(child: Text('Failed to load products. Please try again.'));
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _categoryInfo(provider.products),
                  const SizedBox(height: 10),
                  _products(provider.products),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _categoryInfo(List<ProductEntity> products) {
    return Text(
      '${categoryEntity.title} (${products.length})',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(productEntity: products[index]);
        },
      ),
    );
  }
}
