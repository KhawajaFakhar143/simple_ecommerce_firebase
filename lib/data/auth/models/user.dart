import 'package:json_annotation/json_annotation.dart';
import 'package:simple_ecommerce_firebase/domain/auth/entities/user.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String? image;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      image: image,
    );
  }
}
