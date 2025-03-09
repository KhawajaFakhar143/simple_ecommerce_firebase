import 'package:flutter/material.dart';
import 'package:simple_ecommerce_firebase/domain/auth/entities/user.dart';
import 'package:simple_ecommerce_firebase/domain/auth/usescase/get_user.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class UserInfoDisplayProvider extends ChangeNotifier {
  UserInfoDisplayProvider();

  bool _isLoading = false;
  String? _errorMessage;
  UserEntity? _user;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  UserEntity? get user => _user;

  Future<void> displayUserInfo() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    var returnedData = await sl<GetUserUseCase>().call();
    returnedData.fold(
      (error) {
        _errorMessage = "Failed to load user data.";
      },
      (data) {
        _user = data;
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}
