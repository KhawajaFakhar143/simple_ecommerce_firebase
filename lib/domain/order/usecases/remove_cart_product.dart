import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce_firebase/core/usecase/usecase.dart';
import 'package:simple_ecommerce_firebase/domain/order/repository/order.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class RemoveCartProductUseCase implements UseCase<Either,String> {
  @override
  Future<Either> call({String ? params}) async {
    return sl<OrderRepository>().removeCartProduct(params!);
  }

}