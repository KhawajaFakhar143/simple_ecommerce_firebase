import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_firebase/common/helper/app_navigator.dart';
import 'package:simple_ecommerce_firebase/core/configs/assets/app_images.dart';
import 'package:simple_ecommerce_firebase/core/configs/themes.dart/colors.dart';
import 'package:simple_ecommerce_firebase/presentation/auth/pages/sign_in.dart';
import 'package:simple_ecommerce_firebase/presentation/splash/bloc/splash_cubit.dart';
import 'package:simple_ecommerce_firebase/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit,SplashState>(
      listener: (context, state) {
        if(state is UnAuthenticated){
  AppNavigator.pushReplacement(context, SigninPage());
        }
        
        
      
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Image.asset(
            AppImages.logo
          ),
        ),
      ),
    );
  }
}