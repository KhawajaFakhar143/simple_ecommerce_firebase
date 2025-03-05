import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_firebase/core/configs/themes.dart/theme.dart';
import 'package:simple_ecommerce_firebase/presentation/splash/bloc/splash_cubit.dart';
import 'package:simple_ecommerce_firebase/presentation/splash/pages/splash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashPage()
      ),
    );

  }
}

