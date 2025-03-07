import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce_firebase/core/usecase/usecase.dart';
import 'package:simple_ecommerce_firebase/data/order/models/order_registration_req.dart';
import 'package:simple_ecommerce_firebase/domain/order/repository/order.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class OrderRegistrationUseCase implements UseCase<Either,OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq ? params}) async {
    return sl<OrderRepository>().orderRegistration(params!);
  }

}