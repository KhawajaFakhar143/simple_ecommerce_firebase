import 'package:flutter/material.dart';
import 'package:simple_ecommerce_firebase/domain/order/entities/product_ordered.dart';
import 'package:simple_ecommerce_firebase/domain/order/usecases/get_cart_products.dart';
import 'package:simple_ecommerce_firebase/domain/order/usecases/remove_cart_product.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class CartProductsDisplayProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  List<ProductOrderedEntity> _products = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<ProductOrderedEntity> get products => _products;

  Future<void> displayCartProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    var returnedData = await sl<GetCartProductsUseCase>().call();

    returnedData.fold(
      (error) {
        _errorMessage = error;
      },
      (data) {
        _products = data;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> removeProduct(ProductOrderedEntity product) async {
    _isLoading = true;
    notifyListeners();

    var returnedData = await sl<RemoveCartProductUseCase>().call(params: product.id);

    returnedData.fold(
      (error) {
        _errorMessage = error;
      },
      (data) {
        displayCartProducts(); 
      },
    );
  }
}
