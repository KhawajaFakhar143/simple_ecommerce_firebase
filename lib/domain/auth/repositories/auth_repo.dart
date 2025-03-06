import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce_firebase/data/auth/models/user_creation_req.dart';

abstract class AuthRepository {

  Future<Either> signup(UserCreationReq user);
  
  }