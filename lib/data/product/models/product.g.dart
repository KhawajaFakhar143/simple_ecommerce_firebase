// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      categoryId: json['categoryId'] as String,
      createdDate: ProductModel._timestampFromJson(json['createdDate']),
      discountedPrice: json['discountedPrice'] as num,
      gender: (json['gender'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as num,
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
      productId: json['productId'] as String,
      salesNumber: (json['salesNumber'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'createdDate': ProductModel._timestampToJson(instance.createdDate),
      'discountedPrice': instance.discountedPrice,
      'gender': instance.gender,
      'images': instance.images,
      'price': instance.price,
      'sizes': instance.sizes,
      'productId': instance.productId,
      'salesNumber': instance.salesNumber,
      'title': instance.title,
    };
