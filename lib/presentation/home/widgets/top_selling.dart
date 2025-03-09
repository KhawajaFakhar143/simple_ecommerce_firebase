import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecommerce_firebase/common/state_managment/product/products_display_provider.dart';
import 'package:simple_ecommerce_firebase/common/widgets/product/product_card.dart';
import 'package:simple_ecommerce_firebase/domain/product/entities/product.dart';
import 'package:simple_ecommerce_firebase/domain/product/usecases/get_top_selling.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsDisplayProvider(useCase: sl<GetTopSellingUseCase>())..displayProducts(),
      child: Consumer<ProductsDisplayProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }
          if (provider.products.isEmpty) {
            return const Center(child: Text("No top-selling products available"));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topSelling(),
              const SizedBox(height: 20),
              _products(provider.products),
            ],
          );
        },
      ),
    );
  }

  Widget _topSelling() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Top Selling',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(productEntity: products[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: products.length,
      ),
    );
  }
}
