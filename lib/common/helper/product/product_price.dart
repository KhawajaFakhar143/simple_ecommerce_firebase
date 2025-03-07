import 'package:simple_ecommerce_firebase/domain/product/entities/product.dart';

class ProductPriceHelper {

 static double provideCurrentPrice(ProductEntity product) {
    return product.discountedPrice != 0 ? 
    product.discountedPrice.toDouble() : 
    product.price.toDouble();
  }

  
}