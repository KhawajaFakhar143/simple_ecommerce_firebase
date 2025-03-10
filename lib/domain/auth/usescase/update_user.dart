import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce_firebase/core/usecase/usecase.dart';
import 'package:simple_ecommerce_firebase/data/auth/models/user_creation_req.dart';
import 'package:simple_ecommerce_firebase/domain/auth/repositories/auth_repo.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class UpdateUserUseCase implements UseCase<Either,UserCreationReq> {


  @override
  Future<Either> call({UserCreationReq ? params}) async {
    return await sl<AuthRepository>().updateUser(params!);
  }

  
}