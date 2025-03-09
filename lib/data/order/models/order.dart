import 'package:json_annotation/json_annotation.dart';
import 'package:simple_ecommerce_firebase/data/order/models/order_status.dart';
import 'package:simple_ecommerce_firebase/data/order/models/product_ordered.dart';
import 'package:simple_ecommerce_firebase/domain/order/entities/order.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel {
  final List<ProductOrderedModel> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String? code;
  @JsonKey(defaultValue: [])
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      products: products.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      shippingAddress: shippingAddress,
      itemCount: itemCount,
      totalPrice: totalPrice,
      code: code ?? "",
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}
