import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_firebase/common/bloc/button/button_state.dart';
import 'package:simple_ecommerce_firebase/common/bloc/button/button_state_cubit.dart';
import 'package:simple_ecommerce_firebase/common/helper/product/product_price.dart';
import 'package:simple_ecommerce_firebase/common/widgets/buttons/basic_reactive_button.dart';
import 'package:simple_ecommerce_firebase/domain/product/entities/product.dart';
import 'package:simple_ecommerce_firebase/presentation/product_detail/bloc/product_quantity_cubit.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({
    required this.productEntity,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit,ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          //TODO: Add Cart page here
        } 
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(content: Text(state.errorMessage),behavior: SnackBarBehavior.floating,);
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
          child: BasicReactiveButton(
            onPressed: () {
            //TODO: add cart use case here
            },
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ProductQuantityCubit,int>(
                  builder: (context, state) {
                  var price = ProductPriceHelper.provideCurrentPrice(productEntity) * state;
                  return Text(
                   "\$${price.toString()}",
                   style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14
                  ),
                 );
                }, 
              ),
              const Text(
                 'Add to Bag',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14
                ),
              ),
            ],
          )
      ),
        ),
    );
 }
}