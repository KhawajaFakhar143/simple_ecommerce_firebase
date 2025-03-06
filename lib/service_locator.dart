
import 'package:get_it/get_it.dart';
import 'package:simple_ecommerce_firebase/data/repositories/auth_repository_impl.dart';
import 'package:simple_ecommerce_firebase/data/source/auth_firebase_service.dart';
import 'package:simple_ecommerce_firebase/domain/auth/repositories/auth_repo.dart';
import 'package:simple_ecommerce_firebase/domain/auth/usescase/siginup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Services
  
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );




  // Repositories

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );



  // Usecases

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

 
}
