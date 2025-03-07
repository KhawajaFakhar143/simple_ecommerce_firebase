import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_firebase/common/bloc/categories/categories_display_state.dart';
import 'package:simple_ecommerce_firebase/domain/category/usecases/get_categories.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {

  CategoriesDisplayCubit() : super (CategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          LoadCategoriesFailure()
        );
      }, 
      (data) {
        emit(
          CategoriesLoaded(categories: data)
        );
      }
    );
  }

}