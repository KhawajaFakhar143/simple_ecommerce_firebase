import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce_firebase/data/auth/models/user.dart';
import 'package:simple_ecommerce_firebase/data/auth/models/user_creation_req.dart';
import 'package:simple_ecommerce_firebase/data/auth/models/user_signin_req.dart';
import 'package:simple_ecommerce_firebase/data/auth/source/auth_firebase_service.dart';
import 'package:simple_ecommerce_firebase/domain/auth/repositories/auth_repo.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {

  
  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signup(user);
  }

    @override
  Future<Either> signin(UserSigninReq user) async {
     return await sl<AuthFirebaseService>().signin(user);
  }

    @override
  Future < Either > getUser() async {
    var user = await sl < AuthFirebaseService > ().getUser();
    return user.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          UserModel.fromJson(data).toEntity()
        );
      }
    );
  }
  
  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }
  
  @override
  Future<Either> updateUser(UserCreationReq user)async {
    return await sl<AuthFirebaseService>().updateUser(user);
  }
}