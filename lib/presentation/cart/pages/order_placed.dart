import 'package:flutter/material.dart';
import 'package:simple_ecommerce_firebase/common/helper/app_navigator.dart';
import 'package:simple_ecommerce_firebase/common/widgets/buttons/basic_app_button.dart';
import 'package:simple_ecommerce_firebase/core/configs/assets/app_images.dart';
import 'package:simple_ecommerce_firebase/core/configs/themes.dart/colors.dart';
import 'package:simple_ecommerce_firebase/presentation/home/pages/home.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.orderPlaced
            ) ,
          ),
          const SizedBox(height: 60,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Order Placed Successfully',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 30,),
                  BasicAppButton(
                    title: 'Finish',
                    onPressed: (){
                      AppNavigator.pushAndRemove(context, const HomePage());
                    } 
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}