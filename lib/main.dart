import 'package:flutter/material.dart';
import 'package:mafqud/core/function/check_state_changes.dart';
import 'core/routes/app_router.dart';
import 'core/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  checkStateChanges();
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
        fontFamily: 'Poppins',
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
