import 'package:flutter/material.dart';
import 'package:mafqud/core/routes/app_router.dart';
import 'package:mafqud/core/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mafqud',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.offWhite,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.offWhite,
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 24,
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
