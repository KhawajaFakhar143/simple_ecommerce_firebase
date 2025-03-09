import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_ecommerce_firebase/core/configs/assets/app_images.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  const CachedNetworkImageWidget(this.imageUrl,{super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Image.asset(AppImages.libasLogo),
        errorWidget: (context, url, error) => Icon(Icons.error),
     );
  }
}