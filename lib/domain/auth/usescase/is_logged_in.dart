

import 'package:simple_ecommerce_firebase/core/usecase/usecase.dart';
import 'package:simple_ecommerce_firebase/domain/auth/repositories/auth_repo.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool,dynamic> {

  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }

}