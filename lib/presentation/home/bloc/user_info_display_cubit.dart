import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_firebase/domain/auth/usescase/get_user.dart';
import 'package:simple_ecommerce_firebase/presentation/home/bloc/user_info_display_state.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {

    var returnedData = await sl<GetUserUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          LoadUserInfoFailure()
        );
      }, 
      (data){
        emit(
          UserInfoLoaded(
            user: data
          )
        );
      }
    );
  }
}