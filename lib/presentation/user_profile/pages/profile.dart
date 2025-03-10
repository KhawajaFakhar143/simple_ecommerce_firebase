import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecommerce_firebase/common/state_managment/button/button_state.dart';
import 'package:simple_ecommerce_firebase/common/state_managment/button/button_state_cubit.dart';
import 'package:simple_ecommerce_firebase/common/helper/app_navigator.dart';
import 'package:simple_ecommerce_firebase/common/widgets/app_bar/app_bar.dart';
import 'package:simple_ecommerce_firebase/common/widgets/buttons/basic_reactive_button.dart';
import 'package:simple_ecommerce_firebase/data/auth/models/user_creation_req.dart';
import 'package:simple_ecommerce_firebase/presentation/home/pages/home.dart';
import 'package:simple_ecommerce_firebase/common/state_managment/user_info_display_provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
            if (state is ButtonSuccessState) {
              AppNavigator.pushAndRemove(context, const HomePage());
            }
          },
          child: ChangeNotifierProvider(
            create: (context) => UserInfoDisplayProvider()..displayUserInfo(),
            child: Consumer<UserInfoDisplayProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (provider.errorMessage != null) {
                    var snackbar = SnackBar(
                      content: Text(provider.errorMessage!),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }

                  if (provider.successMessage != null) {
                    var snackbar = SnackBar(
                      content: Text(provider.successMessage!),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                });

                final user = provider.user;
                _firstNameCon.text = user?.firstName ?? "";
                _lastNameCon.text = user?.lastName ?? "";
                _emailCon.text = user?.email ?? "";

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    _firstNameField(),
                    _lastNameField(),
                    _emailField(),
                    _updateButton(context),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _firstNameField() {
    return TextField(
      controller: _firstNameCon,
      decoration: const InputDecoration(hintText: 'Firstname'),
    );
  }

  Widget _lastNameField() {
    return TextField(
      controller: _lastNameCon,
      decoration: const InputDecoration(hintText: 'Lastname'),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Email Address'),
    );
  }

  Widget _updateButton(BuildContext context) {
    return BasicReactiveButton(
        onPressed: () {
          if (_firstNameCon.text.isNotEmpty &&
              _lastNameCon.text.isNotEmpty &&
              _emailCon.text.isNotEmpty) {
            context.read<UserInfoDisplayProvider>().updateUser(UserCreationReq(
                firstName: _firstNameCon.text,
                email: _emailCon.text,
                lastName: _lastNameCon.text,
                password: null));
          } else {
            var snackbar = SnackBar(
              content: Text("One or more fields are empty, unable to update"),
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        title: 'Update');
  }
}
