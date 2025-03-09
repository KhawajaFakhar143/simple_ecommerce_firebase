import 'package:json_annotation/json_annotation.dart';
import '../../../domain/category/entity/category.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryModel {
  final String title;
  final String categoryId;
  final String image;

  CategoryModel({
    required this.title,
    required this.categoryId,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      image: image,
      title: title,
    );
  }
}
