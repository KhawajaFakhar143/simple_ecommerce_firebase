import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:simple_ecommerce_firebase/domain/order/entities/order_status.dart';

part 'order_status.g.dart';

@JsonSerializable()
class OrderStatusModel {
  final String title;
  final bool done;

  @JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp)
  final Timestamp createdDate;

  OrderStatusModel({
    required this.title,
    required this.done,
    required this.createdDate,
  });

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) => _$OrderStatusModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderStatusModelToJson(this);

  static Timestamp _fromTimestamp(Timestamp timestamp) => timestamp;
  static dynamic _toTimestamp(Timestamp timestamp) => timestamp;
}

extension OrderStatusXModel on OrderStatusModel {
  OrderStatusEntity toEntity() {
    return OrderStatusEntity(
      createdDate: createdDate,
      done: done,
      title: title,
    );
  }
}
