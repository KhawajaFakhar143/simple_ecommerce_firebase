// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartReq _$AddToCartReqFromJson(Map<String, dynamic> json) => AddToCartReq(
      productId: json['productId'] as String,
      productTitle: json['productTitle'] as String,
      productQuantity: (json['productQuantity'] as num).toInt(),
      productSize: json['productSize'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      productImage: json['productImage'] as String,
      createdDate: json['createdDate'] as String,
    );

Map<String, dynamic> _$AddToCartReqToJson(AddToCartReq instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productTitle': instance.productTitle,
      'productQuantity': instance.productQuantity,
      'productSize': instance.productSize,
      'productPrice': instance.productPrice,
      'totalPrice': instance.totalPrice,
      'productImage': instance.productImage,
      'createdDate': instance.createdDate,
    };
