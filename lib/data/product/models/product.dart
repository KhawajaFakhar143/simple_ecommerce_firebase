import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:simple_ecommerce_firebase/domain/product/entities/product.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductModel {
  final String categoryId;

  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final Timestamp createdDate;

  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;

  ProductModel({
    required this.categoryId,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
  });


  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);


  static Timestamp _timestampFromJson(dynamic value) => value as Timestamp;
  static dynamic _timestampToJson(Timestamp timestamp) => timestamp;
}


extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      sizes: sizes,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
    );
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
      categoryId: categoryId,
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      sizes: sizes,
      productId: productId,
      salesNumber: salesNumber,
      title: title,
    );
  }
}
