
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_firebase/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {

  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    if (true) {
      emit(
        UnAuthenticated()
      );
    } 
  }
}