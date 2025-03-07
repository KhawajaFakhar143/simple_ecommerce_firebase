
import 'package:get_it/get_it.dart';
import 'package:simple_ecommerce_firebase/data/auth/repositories/auth_repository_impl.dart';
import 'package:simple_ecommerce_firebase/data/auth/source/auth_firebase_service.dart';
import 'package:simple_ecommerce_firebase/data/category/repository/category.dart';
import 'package:simple_ecommerce_firebase/data/category/source/category_firebase_service.dart';
import 'package:simple_ecommerce_firebase/data/order/repository/order.dart';
import 'package:simple_ecommerce_firebase/data/order/source/order_firebase_service.dart';
import 'package:simple_ecommerce_firebase/data/product/repository/product.dart';
import 'package:simple_ecommerce_firebase/data/product/source/product_firebase_service.dart';
import 'package:simple_ecommerce_firebase/domain/auth/repositories/auth_repo.dart';
import 'package:simple_ecommerce_firebase/domain/auth/usescase/get_user.dart';
import 'package:simple_ecommerce_firebase/domain/auth/usescase/is_logged_in.dart';
import 'package:simple_ecommerce_firebase/domain/auth/usescase/siginup.dart';
import 'package:simple_ecommerce_firebase/domain/auth/usescase/signin.dart';
import 'package:simple_ecommerce_firebase/domain/category/repository/category.dart';
import 'package:simple_ecommerce_firebase/domain/category/usecases/get_categories.dart';
import 'package:simple_ecommerce_firebase/domain/order/repository/order.dart';
import 'package:simple_ecommerce_firebase/domain/order/usecases/add_to_cart.dart';
import 'package:simple_ecommerce_firebase/domain/order/usecases/get_cart_products.dart';
import 'package:simple_ecommerce_firebase/domain/order/usecases/get_orders.dart';
import 'package:simple_ecommerce_firebase/domain/order/usecases/order_registration.dart';
import 'package:simple_ecommerce_firebase/domain/order/usecases/remove_cart_product.dart';
import 'package:simple_ecommerce_firebase/domain/product/repository/product.dart';
import 'package:simple_ecommerce_firebase/domain/product/usecases/add_or_remove_favorite_product.dart';
import 'package:simple_ecommerce_firebase/domain/product/usecases/get_favorties_products.dart';
import 'package:simple_ecommerce_firebase/domain/product/usecases/get_new_in.dart';
import 'package:simple_ecommerce_firebase/domain/product/usecases/get_products_by_category_id.dart';
import 'package:simple_ecommerce_firebase/domain/product/usecases/get_products_by_title.dart';
import 'package:simple_ecommerce_firebase/domain/product/usecases/get_top_selling.dart';
import 'package:simple_ecommerce_firebase/domain/product/usecases/is_favorite.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Services
  
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );
   sl.registerSingleton<CategoryFirebaseService>(
    CategoryFirebaseServiceImpl()
  );
     sl.registerSingleton<ProductFirebaseService>(
    ProductFirebaseServiceImpl()
  );
 
    sl.registerSingleton<OrderFirebaseService>(
    OrderFirebaseServiceImpl()
  );
  




  // Repositories

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );
   sl.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl()
  );
   sl.registerSingleton<ProductRepository>(
    ProductRepositoryImpl()
  );

 
    sl.registerSingleton<OrderRepository>(
    OrderRepositoryImpl()
  );



  // Usecases


  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );



  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );


  sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase()
  );

  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase()
  );

  sl.registerSingleton<GetCategoriesUseCase>(
    GetCategoriesUseCase()
  );

  sl.registerSingleton<GetTopSellingUseCase>(
    GetTopSellingUseCase()
  );

  sl.registerSingleton<GetNewInUseCase>(
    GetNewInUseCase()
  );

  sl.registerSingleton<GetProductsByCategoryIdUseCase>(
    GetProductsByCategoryIdUseCase()
  );

  sl.registerSingleton<GetProductsByTitleUseCase>(
    GetProductsByTitleUseCase()
  );

  sl.registerSingleton<AddToCartUseCase>(
    AddToCartUseCase()
  );

  sl.registerSingleton<GetCartProductsUseCase>(
    GetCartProductsUseCase()
  );

  sl.registerSingleton<RemoveCartProductUseCase>(
    RemoveCartProductUseCase()
  );

  sl.registerSingleton<OrderRegistrationUseCase>(
    OrderRegistrationUseCase()
  );

  sl.registerSingleton<AddOrRemoveFavoriteProductUseCase>(
    AddOrRemoveFavoriteProductUseCase()
  );

  sl.registerSingleton<IsFavoriteUseCase>(
    IsFavoriteUseCase()
  );

   sl.registerSingleton<GetFavortiesProductsUseCase>(
    GetFavortiesProductsUseCase()
  );

  sl.registerSingleton<GetOrdersUseCase>(
    GetOrdersUseCase()
  );

  
 
}
