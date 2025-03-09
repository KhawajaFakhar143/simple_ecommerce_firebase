import 'package:flutter/widgets.dart';
import 'package:simple_ecommerce_firebase/domain/category/entity/category.dart';
import 'package:simple_ecommerce_firebase/domain/category/usecases/get_categories.dart';


class CategoriesDisplayProvider extends ChangeNotifier {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesDisplayProvider({required this.getCategoriesUseCase});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<CategoryEntity> _categories = [];
  List<CategoryEntity> get categories => _categories;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setCategories(List<CategoryEntity> newCategories) {
    _categories = newCategories;
    _errorMessage = null; 
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    _categories = []; 
    notifyListeners();
  }

  Future<void> displayCategories() async {
    _setLoading(true);

    var returnedData = await getCategoriesUseCase.call();
    _setLoading(false);

    returnedData.fold(
      (error) => _setError("Failed to load categories"), 
      (data) => _setCategories(data),
    );
  }
}