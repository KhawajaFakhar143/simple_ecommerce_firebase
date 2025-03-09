import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_req.g.dart';

@JsonSerializable()
class AddToCartReq {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;

  AddToCartReq({
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createdDate,
  });

  factory AddToCartReq.fromJson(Map<String, dynamic> json) => _$AddToCartReqFromJson(json);
  Map<String, dynamic> toJson() => _$AddToCartReqToJson(this);
}
