import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecommerce_firebase/common/state_managment/categories/categories_display_provider.dart';
import 'package:simple_ecommerce_firebase/common/helper/app_navigator.dart';
import 'package:simple_ecommerce_firebase/common/helper/images/image_display.dart';
import 'package:simple_ecommerce_firebase/common/widgets/app_bar/app_bar.dart';
import 'package:simple_ecommerce_firebase/core/configs/themes.dart/colors.dart';
import 'package:simple_ecommerce_firebase/domain/category/usecases/get_categories.dart';
import 'package:simple_ecommerce_firebase/presentation/category_products/pages/category_products.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoriesDisplayProvider(
        getCategoriesUseCase: sl<GetCategoriesUseCase>(),
      )..displayCategories(),
      child: Scaffold(
        appBar: const BasicAppbar(hideBack: false),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _shopByCategories(),
              const SizedBox(height: 10),
              _categories(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shopByCategories() {
    return const Text(
      'Shop by Categories',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }

  Widget _categories() {
    return Consumer<CategoriesDisplayProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.errorMessage != null) {
          return Center(child: Text(provider.errorMessage!));
        }

        if (provider.categories.isEmpty) {
          return const Center(child: Text("No categories available"));
        }

        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final category = provider.categories[index];
            return GestureDetector(
              onTap: () {
                AppNavigator.push(
                  context,
                  CategoryProductsPage(categoryEntity: category),
                );
              },
              child: Container(
                height: 70,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            ImageDisplayHelper.generateCategoryImageURL(
                              category.image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      category.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: provider.categories.length,
        );
      },
    );
  }
}
