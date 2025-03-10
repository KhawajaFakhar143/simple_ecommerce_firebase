import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce_firebase/data/auth/models/user_creation_req.dart';
import 'package:simple_ecommerce_firebase/data/auth/models/user_signin_req.dart';

abstract class AuthRepository {

  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> updateUser(UserCreationReq user);
   Future<Either> getUser();
     Future<bool> isLoggedIn();
  
  }