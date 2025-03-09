// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductOrderedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdDate: json['createdDate'] as String,
      shippingAddress: json['shippingAddress'] as String,
      itemCount: (json['itemCount'] as num).toInt(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      code: json['code'] as String?,
      orderStatus: (json['orderStatus'] as List<dynamic>?)
              ?.map((e) => OrderStatusModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
      'createdDate': instance.createdDate,
      'shippingAddress': instance.shippingAddress,
      'itemCount': instance.itemCount,
      'totalPrice': instance.totalPrice,
      'code': instance.code,
      'orderStatus': instance.orderStatus.map((e) => e.toJson()).toList(),
    };
