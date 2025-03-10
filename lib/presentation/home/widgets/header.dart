import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecommerce_firebase/common/helper/app_navigator.dart';
import 'package:simple_ecommerce_firebase/core/configs/assets/app_images.dart';
import 'package:simple_ecommerce_firebase/core/configs/themes.dart/colors.dart';
import 'package:simple_ecommerce_firebase/domain/auth/entities/user.dart';
import 'package:simple_ecommerce_firebase/presentation/cart/pages/cart.dart';
import 'package:simple_ecommerce_firebase/common/state_managment/user_info_display_provider.dart';
import 'package:simple_ecommerce_firebase/presentation/settings/pages/settings.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserInfoDisplayProvider()..displayUserInfo(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          right: 16,
          left: 16,
        ),
        child: Consumer<UserInfoDisplayProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (provider.errorMessage != null) {
              return const Center(child: Text("Failed to load user data"));
            }
            if (provider.user != null) {
              final user = provider.user!;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImage(user, context),
                  _logo(),
                  _cart(context),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _profileImage(UserEntity user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const SettingsPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: user.image?.isEmpty ?? true
                ? const AssetImage(AppImages.profile)
                : NetworkImage(user.image!) as ImageProvider,
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
        height: 40,
        
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                AppImages.libasLogo,
                fit: BoxFit.fill,
              )),
        ));
  }

  Widget _cart(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const CartPage());
      },
      child: const CircleAvatar(
        backgroundColor: AppColors.primary,
        child: Icon(Icons.shopping_bag, color: Colors.white),
      ),
    );
  }
}
