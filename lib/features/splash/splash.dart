import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/function/navigation.dart';
import '../../core/utils/app_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    FirebaseAuth.instance.currentUser == null
        ? delayedNavigate(context, '/loginView')
        : FirebaseAuth.instance.currentUser!.emailVerified == true
            ? delayedNavigate(context, "/homeView")
            : delayedNavigate(context, "/loginView");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Mafqud",
          style: CustomTextStyle.pacificoSplash.copyWith(
            fontFamily: 'Pacifico',
          ),
        ),
      ),
    );
  }

  void delayedNavigate(contex, path) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        customReplacementNavigate(context, path);
      },
    );
  }
}
