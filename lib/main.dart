import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ecommerce_firebase/common/bloc/button/button_state_cubit.dart';
import 'package:simple_ecommerce_firebase/core/configs/themes.dart/theme.dart';
import 'package:simple_ecommerce_firebase/presentation/splash/bloc/splash_cubit.dart';
import 'package:simple_ecommerce_firebase/presentation/splash/pages/splash.dart';
import 'package:simple_ecommerce_firebase/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ButtonStateCubit()),
             BlocProvider(create: (context) => SplashCubit()..appStarted())
          ],
      child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashPage()),
    );
  }
}
