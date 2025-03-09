// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_ordered.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOrderedModel _$ProductOrderedModelFromJson(Map<String, dynamic> json) =>
    ProductOrderedModel(
      productId: json['productId'] as String,
      productTitle: json['productTitle'] as String,
      productQuantity: (json['productQuantity'] as num).toInt(),
      productSize: json['productSize'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      productImage: json['productImage'] as String,
      createdDate: json['createdDate'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ProductOrderedModelToJson(
        ProductOrderedModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productTitle': instance.productTitle,
      'productQuantity': instance.productQuantity,
      'productSize': instance.productSize,
      'productPrice': instance.productPrice,
      'totalPrice': instance.totalPrice,
      'productImage': instance.productImage,
      'createdDate': instance.createdDate,
      'id': instance.id,
    };
