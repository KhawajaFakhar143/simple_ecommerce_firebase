import 'package:dartz/dartz.dart';
import 'package:simple_ecommerce_firebase/data/category/models/category.dart';
import 'package:simple_ecommerce_firebase/data/category/source/category_firebase_service.dart';
import 'package:simple_ecommerce_firebase/domain/category/repository/category.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {


  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();
    return categories.fold(
      (error){
        return Left(error);
      }, 
      (data){
        return Right(
          List.from(data).map((e) => CategoryModel.fromJson(e).toEntity()).toList()
        );
      }
    );
  }
  
}