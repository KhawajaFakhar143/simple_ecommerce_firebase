import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_firebase/common/bloc/button/button_state_cubit.dart';
import 'package:simple_ecommerce_firebase/common/widgets/app_bar/app_bar.dart';
import 'package:simple_ecommerce_firebase/domain/product/entities/product.dart';
import 'package:simple_ecommerce_firebase/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:simple_ecommerce_firebase/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:simple_ecommerce_firebase/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:simple_ecommerce_firebase/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:simple_ecommerce_firebase/presentation/product_detail/widgets/add_to_bag.dart';

import '../widgets/favorite_button.dart';
import '../widgets/selected_color.dart';
import '../widgets/product_images.dart';
import '../widgets/product_price.dart';
import '../widgets/product_quantity.dart';
import '../widgets/product_title.dart';
import '../widgets/selected_size.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()),
        BlocProvider(create: (context) => ProductColorSelectionCubit()),
        BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(create: (context) => FavoriteIconCubit()..isFavorite(productEntity.productId))
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,  
          action: FavoriteButton(
            productEntity: productEntity,
          ),
         ),
          bottomNavigationBar: AddToBag(productEntity: productEntity,),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                ProductImages(productEntity: productEntity, ),
                ProductTitle(productEntity: productEntity, ),
                ProductPrice(productEntity: productEntity, ),
                const SizedBox(height: 10, ),
                SelectedSize(productEntity: productEntity, ),
                const SizedBox(height: 5, ),
                SelectedColor(productEntity: productEntity, ),
                const SizedBox(height: 5, ),
                ProductQuantity(productEntity: productEntity, ),
              ],
            ),
          ),
      ),
    );
  }
}