import 'package:json_annotation/json_annotation.dart';
import 'package:simple_ecommerce_firebase/domain/order/entities/product_ordered.dart';

part 'product_ordered.g.dart';

@JsonSerializable()
class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;
  final String id;

  ProductOrderedModel({
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createdDate,
    required this.id,
  });

  factory ProductOrderedModel.fromJson(Map<String, dynamic> json) => _$ProductOrderedModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductOrderedModelToJson(this);
}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      productId: productId,
      productTitle: productTitle,
      productQuantity: productQuantity,
      productSize: productSize,
      productPrice: productPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      createdDate: createdDate,
      id: id,
    );
  }
}

extension ProductOrderedXEntity on ProductOrderedEntity {
  ProductOrderedModel fromEntity() {
    return ProductOrderedModel(
      productId: productId,
      productTitle: productTitle,
      productQuantity: productQuantity,
      productSize: productSize,
      productPrice: productPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      createdDate: createdDate,
      id: id,
    );
  }
}
