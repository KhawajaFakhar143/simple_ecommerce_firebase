
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simple_ecommerce_firebase/common/helper/app_navigator.dart';
import 'package:simple_ecommerce_firebase/common/widgets/app_bar/app_bar.dart';
import 'package:simple_ecommerce_firebase/common/widgets/buttons/basic_app_button.dart';
import 'package:simple_ecommerce_firebase/presentation/auth/pages/sign_up.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _siginText(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
                const SizedBox(height: 20,),
            _continueButton(context),
            const SizedBox(height: 20,),
            _createAccount(context)
          ],
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return const Text(
      'Sign in',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Enter Email'
      ),
    );
  }
   Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: 'Enter Password'
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: (){
        // AppNavigator.push(
        //   context, 
        //   EnterPasswordPage(
        //     signinReq: UserSigninReq(
        //       email: _emailCon.text,
        //     ),
        //   )
        // );
      },
      title: 'Continue'
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children:  [
          const TextSpan(
            text: "Don't you have an account? "
          ),
           TextSpan(
            text: 'Create one',
            recognizer:TapGestureRecognizer()..onTap = () {
              AppNavigator.push(context,SignupPage());
            } ,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            )
          )
        ]

      ),
    );
  }
}