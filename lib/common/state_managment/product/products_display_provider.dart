import 'package:flutter/material.dart';
import 'package:simple_ecommerce_firebase/core/usecase/usecase.dart';
import 'package:simple_ecommerce_firebase/domain/product/entities/product.dart';

class ProductsDisplayProvider extends ChangeNotifier {
  final UseCase useCase;
  
  ProductsDisplayProvider({required this.useCase});

  bool isLoading = false;
  String? errorMessage;
  List<ProductEntity> products = [];

  Future<void> displayProducts({dynamic params}) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    var returnedData = await useCase.call(params: params);
    returnedData.fold(
      (error) {
        errorMessage = "Failed to load products";
      },
      (data) {
        products = data;
      },
    );

    isLoading = false;
    notifyListeners();
  }

  void displayInitial() {
    products = [];
    errorMessage = null;
    isLoading = false;
    notifyListeners();
  }
}
