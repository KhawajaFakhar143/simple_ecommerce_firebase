import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_firebase/common/bloc/button/button_state.dart';
import 'package:simple_ecommerce_firebase/common/bloc/button/button_state_cubit.dart';
import 'package:simple_ecommerce_firebase/common/helper/app_navigator.dart';
import 'package:simple_ecommerce_firebase/common/widgets/app_bar/app_bar.dart';
import 'package:simple_ecommerce_firebase/common/widgets/buttons/basic_reactive_button.dart';
import 'package:simple_ecommerce_firebase/data/auth/models/user_signin_req.dart';
import 'package:simple_ecommerce_firebase/domain/auth/usescase/signin.dart';
import 'package:simple_ecommerce_firebase/presentation/auth/pages/sign_up.dart';
import 'package:simple_ecommerce_firebase/presentation/home/pages/home.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: true,
      ),
      body: BlocListener<ButtonStateCubit, ButtonState>(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              _siginText(context),
              _emailField(context),
              _passwordField(context),
              _continueButton(context),
              _createAccount(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return const Text(
      'Sign in',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Enter Email'),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Enter Password'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                usecase: SigninUseCase(),
                params: UserSigninReq(
                  email: _emailCon.text,
                  password: _passwordCon.text,
                ));
          },
          title: 'Continue');
    });
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(text: "Don't you have an account? "),
        TextSpan(
            text: 'Create one',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignupPage());
              },
            style: const TextStyle(fontWeight: FontWeight.bold))
      ]),
    );
  }
}
