import 'package:flutter/material.dart';
import 'package:simple_ecommerce_firebase/common/helper/images/image_display.dart';
import 'package:simple_ecommerce_firebase/common/widgets/cached_image/cached_image.dart';
import 'package:simple_ecommerce_firebase/domain/product/entities/product.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImages({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
                width: 200,
                child: CachedNetworkImageWidget(
                    ImageDisplayHelper.generateProductImageURL(
                        productEntity.images[index])));
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: productEntity.images.length),
    );
  }
}
