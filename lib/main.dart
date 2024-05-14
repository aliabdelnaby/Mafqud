import 'package:flutter/material.dart';
import 'package:mafqud/core/utils/app_colors.dart';
import 'package:mafqud/features/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //! This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 24,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Mafqud',
      home: const SplashView(),
    );
  }
}
