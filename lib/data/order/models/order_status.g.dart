// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusModel _$OrderStatusModelFromJson(Map<String, dynamic> json) =>
    OrderStatusModel(
      title: json['title'] as String,
      done: json['done'] as bool,
      createdDate:
          OrderStatusModel._fromTimestamp(json['createdDate'] as Timestamp),
    );

Map<String, dynamic> _$OrderStatusModelToJson(OrderStatusModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'done': instance.done,
      'createdDate': OrderStatusModel._toTimestamp(instance.createdDate),
    };
