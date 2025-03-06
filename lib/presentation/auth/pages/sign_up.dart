import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_firebase/common/bloc/button/button_state.dart';
import 'package:simple_ecommerce_firebase/common/bloc/button/button_state_cubit.dart';
import 'package:simple_ecommerce_firebase/common/helper/app_navigator.dart';
import 'package:simple_ecommerce_firebase/common/widgets/app_bar/app_bar.dart';
import 'package:simple_ecommerce_firebase/common/widgets/buttons/basic_reactive_button.dart';
import 'package:simple_ecommerce_firebase/data/auth/models/user_creation_req.dart';
import 'package:simple_ecommerce_firebase/domain/auth/usescase/siginup.dart';
import 'package:simple_ecommerce_firebase/presentation/auth/pages/sign_in.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body:SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: BlocListener<ButtonStateCubit,ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState){
              var snackbar = SnackBar(content: Text(state.errorMessage),behavior: SnackBarBehavior.floating,);
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _siginText(),
              const SizedBox(
                height: 20,
              ),
              _firstNameField(),
              const SizedBox(
                height: 20,
              ),
              _lastNameField(),
              const SizedBox(
                height: 20,
              ),
              _emailField(),
              const SizedBox(
                height: 20,
              ),
              _passwordField(context),
              const SizedBox(
                height: 20,
              ),
              _continueButton(context),
              const SizedBox(
                height: 20,
              ),
              _createAccount(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _siginText() {
    return const Text(
      'Create Account',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicReactiveButton(
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
              usecase: SignupUseCase(),
              params: UserCreationReq(
                  firstName: _firstNameCon.text,
                  email: _emailCon.text,
                  lastName: _lastNameCon.text,
                  password: _passwordCon.text));
        },
        title: 'Create');
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(text: "Do you have an account? "),
        TextSpan(
            text: 'Signin',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushReplacement(context, SigninPage());
              },
            style: const TextStyle(fontWeight: FontWeight.bold))
      ]),
    );
  }
}
