import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecommerce_firebase/common/widgets/app_bar/app_bar.dart';
import 'package:simple_ecommerce_firebase/presentation/cart/provider/cart_products_display_provider.dart';
import '../../../domain/order/entities/product_ordered.dart';
import '../widgets/checkout.dart';
import '../widgets/product_ordered_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Cart'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CartProductsDisplayProvider()..displayCartProducts(),
        child: Consumer<CartProductsDisplayProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (provider.errorMessage != null) {
              return Center(
                child: Text(provider.errorMessage!),
              );
            }
            if (provider.products.isEmpty) {
              return Center(child: _cartIsEmpty());
            }
            return Stack(
              children: [
                _products(provider.products),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Checkout(products: provider.products),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ProductOrderedCard(
          productOrderedEntity: products[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: products.length,
    );
  }

  Widget _cartIsEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.shopify_outlined, color: Colors.white),
        const SizedBox(height: 20),
        const Text(
          "Cart is empty",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ],
    );
  }
}
