import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce_firebase/core/usecase/usecase.dart';
import 'package:simple_ecommerce_firebase/domain/product/repository/product.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class GetProductsByCategoryIdUseCase implements UseCase<Either,String> {

  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductRepository>().getProductsByCategoryId(params!);
  }

}