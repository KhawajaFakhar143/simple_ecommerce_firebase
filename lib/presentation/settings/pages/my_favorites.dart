import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecommerce_firebase/common/state_managment/product/products_display_provider.dart';
import 'package:simple_ecommerce_firebase/common/widgets/app_bar/app_bar.dart';
import 'package:simple_ecommerce_firebase/common/widgets/product/product_card.dart';
import 'package:simple_ecommerce_firebase/domain/product/entities/product.dart';
import 'package:simple_ecommerce_firebase/domain/product/usecases/get_favorties_products.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsDisplayProvider(useCase: sl<GetFavortiesProductsUseCase>())..displayProducts(),
      child: Scaffold(
        appBar: const BasicAppbar(
          title: Text('My Favorites'),
        ),
        body: Consumer<ProductsDisplayProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (provider.errorMessage != null) {
              return const Center(child: Text('Please try again'));
            }
            if (provider.products.isEmpty) {
              return const Center(child: Text('No favorite products found'));
            }
            return _products(provider.products);
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return ProductCard(productEntity: products[index]);
        },
      ),
    );
  }
}
